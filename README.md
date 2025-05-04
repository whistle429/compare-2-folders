# compare-2-folders
用于比较两个文件夹的全部内容

PowerShell报错：

> 无法加载文件 E:\Compare.ps1，因为在此系统上禁止运行脚本。

这是**PowerShell执行策略**导致的，是很常见且容易解决的问题。

---

## 解决方法

1. 打开PowerShell（建议以普通用户身份即可）。

2. 在PowerShell窗口中输入以下命令，然后回车：

   ```powershell
   Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned
   ```

   说明：
   - 只对当前这个PowerShell窗口有效，关闭后恢复原策略。
   - 很安全，不会影响系统其它地方。

3. 然后 cd 到你的脚本所在目录，运行你的脚本：

   ```powershell
   cd E:\
   .\Compare.ps1
   ```
