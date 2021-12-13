# NSIS: code style guidelines

<!-- Comment example: -->
<table>
<tr><td><b>Only `;` to comment out the code</b></td></tr>

<tr>
<td>

```nsis
!include "arch.nsh" ; Include header file
```

</td>
</tr>
</table>

---

## Basic example

<!-- Section example: -->
<details>
	<summary>Click to see a basic example for a Section</summary>

```nsis
Section "section-name"
	...
SectionEnd ; end the `section-name` Section
; :----------------------------------------
```
</details>

---

<!-- Function example: -->
<details>
	<summary>Click to see a basic example for a Function</summary>

```nsis
Function .onInit
	...
FunctionEnd ; end the `function-name` Fucntion
; :-------------------------------------------
```
</details>

---

<!-- PageEx example: -->
<details>
	<summary>Click to see a basic example for a PageEx</summary>

```nsis
PageEx license
	...
PageExEnd ; end the `pageex-name` PageEx
; :-------------------------------------
```
</details>
