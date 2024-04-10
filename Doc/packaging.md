# Packaging on Linux

In Linux, a software package is a collection of files that make up a software application. Its purpose is to simplify the installation and maintenance of software applications in the system. There are two main types of package formats in Linux: distro-native packaging formats (such as deb and rpm) and containerized application packaging formats (such as Snap, Flatpak, and AppImage). The major distinction between the two types of package formats is the way they handle the dependencies of the application. 

# Native

This group expects dependencies to be available on the system.
Three main software packaging systems exists among [Linux distributions](distrowatch.com).

* rpm     - Redhat derivates
* deb     - Debian derivates 
* tar.zst - Arch and derivates

Native packages can include additional [scripts hooks](scripts.md) to extend integration on system.

# Containerized

Application packaging formats (like Snap) pack the dependencies together with the application in the same package. This ensures that there will be no conflicts of dependencies between different applications. Because this are large packages than distro-native packages they all supports binary delta updates.

## Snaps

Snaps is a packaging format developed by Canonical, the company behind the Ubuntu Linux distribution. Besides that, the Snap packages are listed on a centralized repository, known as the [Snap Store](https://snapcraft.io/store). This centralized repository makes it easy for end users to browse and install available applications.

Behind the scenes, **there’s a daemon process, *snapd*, that performs various tasks to manage the Snap packages** — for example, fetching package files from a remote repository when we install a Snap package. Besides that, it also runs these steps prior to running Snap packages, such as mounting, creating a sandbox, and running the application. **To interact with the *snapd* daemon, we use the *snap* command-line tool**. Additionally, we can use the *snapcraft* command-line tool to create the Snap packages and optionally publish them to the Snap Store.

Links:
 * https://snapcraft.io/

## Flatpak

**Flatpak is another packaging format in Linux that aims to make it easy to distribute applications**. In Flatpak, every application package is built against a runtime. This runtime provides the basic dependencies for the application. One example of the runtime is the [Freedesktop runtime](https://docs.flatpak.org/en/latest/available-runtimes.html#freedesktop), which provides a set of essential libraries such as [D-Bus](https://www.freedesktop.org/wiki/Software/dbus/), [GLib](https://docs.gtk.org/glib/), [Gtk3](https://docs.gtk.org/gtk3/), and [X11](https://www.baeldung.com/linux/x11).

When an application requires more dependencies than those available on the runtime, the developer can bundle the dependencies as part of the application. This allows the author to either use libraries that are not available on the runtime or use a different version from the one that the runtime provides.

**To manage the Flatpak packages, we can use the *flatpak* command-line tool**. Through this tool, we can list, install, update, and remove packages. Additionally, *flatpak-builder* is the command-line tool for building a Flatpak package.

Links:
 * https://flatpak.org/
 * https://flathub.org/

## Appimage

AppImage is a packaging format that packs the whole application, including its dependencies, into a single file. In fact, on the pages that host the AppImage packages, we can always see AppImage’s motto: “one app = one file”. **In contrast to Flatpak and Snap, the AppImage package itself is the final executable program**. This means there’s no installation of the AppImage package in the traditional sense. In other words, the AppImage package on Linux is akin to the portable *.exe* file on Windows.

Links:
 * https://appimage.org/


 # See also

 * https://cmake.org/
 * https://nixos.org/
 