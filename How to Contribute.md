# 提交代码的全流程

## 1. Fork 仓库
1. 打开浏览器，访问目标仓库的 GitHub 页面， [https://github.com/Echo-Nie/Project-AdvancedTraining](https://github.com/Echo-Nie/Project-AdvancedTraining)。
2. 点击页面右上角的 `Fork` 按钮。
3. 等一会儿，你会看到这个仓库出现在你的 GitHub 账号下。



## 2. Clone 仓库到本地
1. 在你的 GitHub 仓库页面，点击右上角的 `Code` 按钮，复制仓库的 HTTPS 地址。

2. 在电脑上找一个文件夹，打开cmd，

4. 输入以下命令来下载仓库：
   ```bash
   git clone <你刚才复制的仓库地址>
   ```
   例如：
   ```bash
   git clone https://github.com/your-username/Project-AdvancedTraining.git
   ```
   
4. 等一会儿，你会在文件夹下看到一个名为 `Project-AdvancedTraining` 的文件夹，里面就是仓库的内容了。



## 3. 添加上游仓库并同步最新代码
1. 在命令提示符或终端中，进入 `Project-AdvancedTraining` 文件夹：
   ```bash
   cd Project-AdvancedTraining
   ```
   
2. 添加上游仓库：
   ```bash
   git remote add upstream https://github.com/Echo-Nie/Project-AdvancedTraining.git
   ```
   - `git remote add`：添加一个新的远程仓库。
   - `upstream`：这是你给远程仓库起的别名，通常用来指代原始仓库。
   - `https://github.com/Echo-Nie/Project-AdvancedTraining.git`：原始仓库的地址。

3. 同步最新代码：
   ```bash
   git fetch upstream main
   ```
   - `git fetch`：从远程仓库拉取最新的代码，但不会自动合并到你的本地分支。
   - `upstream`：你之前添加的远程仓库别名。
   - `main`：远程仓库的主分支名称。

4. 更新本地 `main` 分支：
   ```bash
   git checkout main
   ```
   - `git checkout`：切换到指定的分支。
   - `main`：分支名称。

   ```bash
   git merge upstream/main
   ```
   - `git merge`：将另一个分支的更改合并到当前分支。
   - `upstream/main`：从上游仓库的 `main` 分支拉取的更改。
   
   

## 4. 在 GitHub 上新建分支并切换到该分支
1. 打开你的 GitHub 仓库页面 [https://github.com/your-username/Project-AdvancedTraining](https://github.com/your-username/Project-AdvancedTraining)。
2. 点击页面左上角的 `main` 分支名称，选择 `view all branches`。
3. 在页面右上角，点击 `New branch` 按钮。
4. 在弹出的对话框中，输入新分支的名字，比如 `complete-name`，然后选择 `main` 作为源分支。
5. 点击 `Create branch` 按钮。

现在，你在 GitHub 上已经创建了一个名为 `complete-name` 的新分支。



## 5. 本地创建新分支并切换到该分支
1. 在命令提示符或终端中，进入 `Project-AdvancedTraining` 文件夹：
   ```bash
   cd Project-AdvancedTraining
   ```
2. 创建并切换到新分支：
   ```bash
   git checkout -b complete-name upstream/main
   ```
   - `git checkout -b`：创建并切换到一个新的分支。
   - `complete-name`：新分支的名称。
   - `upstream/main`：指定新分支基于上游仓库的 `main` 分支创建。

现在，你在本地也创建了一个名为 `complete-name` 的分支，并且已经切换到该分支。



## 6. 修改代码
1. 打开 `Project-AdvancedTraining` 文件夹。
2. 找到 `README.md` 文件，用文本编辑器（如 VS Code、Notepad++ 等）打开它。
3. 修改文件内容，比如把名字从 `Echo` 改成 `Echo Nie`。
4. 保存文件。



## 7. 添加所有被修改的文件
在命令提示符或终端中，进入 `Project-AdvancedTraining` 文件夹：
```bash
cd Project-AdvancedTraining
```

添加所有被修改的文件：
```bash
git add .
```
- `git add`：将文件添加到暂存区，准备提交。
- `.`：表示当前目录下的所有文件。



## 8. 提交你的修改到本地仓库
提交修改：
```bash
git commit -m "修改了 README.md 文件，把名字改成全名"
```
- `git commit`：将暂存区的更改提交到本地仓库。
- `-m`：添加提交信息。
- `"修改了 README.md 文件，把名字改成全名"`：提交信息，描述你做了什么修改。



## 9. Push 到 GitHub 仓库
推送修改到 GitHub 仓库：
```bash
git push origin complete-name
```
- `git push`：将本地分支的更改推送到远程仓库。
- `origin`：你的 GitHub 仓库的别名。
- `complete-name`：你创建的分支名称。

现在，你的代码已经推送到你在 GitHub 上创建的 `complete-name` 分支。



## 10. 创建 Pull Request (PR)
1. 打开你的 GitHub 仓库页面，你会看到一个 `Compare & pull request` 按钮，点击它。
2. 在弹出的页面中，选择 `base repository` 为原始仓库（`Echo-Nie/Project-AdvancedTraining`），`base` 分支为 `main`，`head repository` 为你的仓库，`compare` 分支为 `complete-name`。
3. 点击 `Create pull request` 按钮。
4. 在 PR 页面，你可以添加更多的描述，说明你的修改内容和目的。
5. 点击 `Create pull request` 按钮，完成 PR 的创建。

现在，你的修改已经提交到了原始仓库的维护者那里，等待审核和合并。
