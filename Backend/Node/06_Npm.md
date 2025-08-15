# npm : Node Package Manager
npm stands for **Node Package Manager**. It's the default package manager for Node.js and is the world's largest software registry. npm is a command-line tool that allows you to install, share, and manage open-source software packages and dependencies for your Node.js projects. 

***

## Uses of npm

* **Installing Packages:** The primary use of npm is to install packages from the npm registry. These packages are reusable code libraries that can save you time and effort by providing solutions for common problems (e.g., handling dates, making API requests, building web servers).
* **Managing Dependencies:** npm keeps track of all the packages your project needs in a `package.json` file. This makes it easy for other developers to set up the project by simply running a single command to install all the required dependencies.
* **Running Scripts:** You can define custom scripts in your `package.json` file to automate tasks like running tests, starting your application, or building your project.

***

## How npm Works

When you install a package, npm does two key things:

1.  It downloads the package and its dependencies from the npm registry and places them in a folder named `node_modules` inside your project directory.
2.  It updates your `package.json` file to list the new package as a dependency and creates a `package-lock.json` file, which records the exact version of every installed package to ensure consistent installations across different environments.

***

## Common npm Commands

Here are some of the most frequently used npm commands:

* **`npm init`**: This command is used to set up a new Node.js project. It creates a `package.json` file, which is a manifest for your project's metadata and dependencies.
* **`npm install <package-name>`**: This command installs a specific package and adds it as a dependency in your `package.json` file. For example, `npm install express`.
* **`npm install`**: When run without a package name in a directory that already has a `package.json` file, this command installs all the dependencies listed in that file. This is what you'd use to set up a project you just cloned from a repository.
* **`npm uninstall <package-name>`**: This command removes a package from your project and updates your `package.json` file accordingly.
* **`npm start`**: This command runs the script defined with the `"start"` key in your `package.json` file, typically used to launch your application.