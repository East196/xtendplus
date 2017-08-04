package com.github.east196.xtendplus.annotation

import com.google.common.annotations.Beta
import com.google.common.annotations.GwtCompatible
import java.lang.annotation.Documented
import java.lang.annotation.ElementType
import java.lang.annotation.Target
import org.eclipse.xtend.lib.annotations.Accessors
import org.eclipse.xtend.lib.annotations.AccessorsProcessor
import org.eclipse.xtend.lib.annotations.DataProcessor
import org.eclipse.xtend.lib.annotations.EqualsHashCode
import org.eclipse.xtend.lib.annotations.EqualsHashCodeProcessor
import org.eclipse.xtend.lib.annotations.FinalFieldsConstructor
import org.eclipse.xtend.lib.annotations.FinalFieldsConstructorProcessor
import org.eclipse.xtend.lib.annotations.ToString
import org.eclipse.xtend.lib.annotations.ToStringConfiguration
import org.eclipse.xtend.lib.annotations.ToStringProcessor
import org.eclipse.xtend.lib.macro.AbstractClassProcessor
import org.eclipse.xtend.lib.macro.Active
import org.eclipse.xtend.lib.macro.TransformationContext
import org.eclipse.xtend.lib.macro.declaration.MutableClassDeclaration
import org.eclipse.xtend.lib.macro.declaration.Visibility

/**
 * Turns this class into a read-only Data object. 
 * 
 * <p>All non-static, non-transient fields ("data fields") become final and a getter is created for each one. For primitive boolean properties, the "is"-prefix is used.
 * The generation of getters can be customized using the {@link Accessors} annotation.</p>
 * <p>If there is no user-defined constructor, a constructor taking all data fields will be generated. 
 * If there already is a constructor, but you want the default one on top of that, you can use the {@link FinalFieldsConstructor} annotation.</p> 
 * <p>Default implementations for {@link Object#equals(Object) equals} and {@link Object#hashCode hashCode} are added if they don't exist yet. See {@link EqualsHashCode} for details.
 * A {@link Object#toString toString} method is added if it doesn't exist yet. See {@link ToString} for details and customization options.</p>
 * 
 * <p>Note: Although no setters are generated, this annotation does not enforce immutability. 
 * Objects passed into the constructor or returned by the getters could be modified by clients. 
 * If immutability is required, you need to implement appropriate defensive copying.</p>
 * @since 2.7
 */
@Target(ElementType.TYPE)
@Active(ValueProcessor)
@Documented
@GwtCompatible
annotation Value {
}

/**
 * @since 2.7
 * @noextend
 * @noreference
 */
@Beta
class ValueProcessor extends AbstractClassProcessor {
	override doTransform(MutableClassDeclaration it, extension TransformationContext context) {
		extension val util = new DataProcessor.Util(context)
		extension val getterUtil = new AccessorsProcessor.Util(context)
		extension val ehUtil = new EqualsHashCodeProcessor.Util(context)
		extension val toStringUtil = new ToStringProcessor.Util(context)
		extension val requiredArgsUtil = new FinalFieldsConstructorProcessor.Util(context)

		if (needsFinalFieldConstructor || findAnnotation(FinalFieldsConstructor.findTypeGlobally) !== null) {
			addFinalFieldsConstructor
		}
		
		dataFields.forEach [
			if (shouldAddGetter) {
				addGetter(getterType?.toVisibility ?: Visibility.PUBLIC)
			}
			if (shouldAddSetter) {
				addSetter(setterType?.toVisibility ?: Visibility.PUBLIC)
			}
		]
		
		if (!hasHashCode) {
			addHashCode(dataFields, hasSuperHashCode)
		}
		if (!hasEquals) {
			addEquals(dataFields, hasSuperEquals)
		}
		if (!hasToString) {
			if (superConstructor === null) {
				addToString(dataFields, toStringConfig ?: new ToStringConfiguration)
			} else {
				addReflectiveToString(toStringConfig ?: new ToStringConfiguration)
			}
		}

	}

	/**
	 * @since 2.7
	 * @noextend
	 * @noreference
 	 */
	@Beta
	static class Util {

		extension TransformationContext context

		new(TransformationContext context) {
			this.context = context
		}

		def getDataFields(MutableClassDeclaration it) {
			declaredFields.filter[!static && ! transient && isThePrimaryGeneratedJavaElement]
		}
	}

}
