From: Patrick Caulfield <patrick@debian.org>
Message-Id: <20020419081253.GP802@tykepenguin.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Unofficial 1.0.3 debs
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Fri Apr 19 03:12:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I've built some debs of LVM 1.0.3 if people want to use those.

The Debian maintainer ill-advisedly (IMHO) packaged 1.1rc1 and we have seen a
small number of bug-reports related to that version on the mailing list, so I
decided to package the latest stable version of LVM and make it available.

These DEBs are based on Robert van der Meulen's lvm10 package and should be a
drop-in replacement.

Add the following to your /etc/apt/sources.list file:

  deb http://people.debian.org/~patrick unstable main

and install using the following command

  # apt-get install lvm10=1.0.3*

You'll need to specify the version number as above because the real Debian
version has a higher number.

Binaries are available for I386/Alpha and (when it finished building!) sparc

I say again these are 100% unofficial and are independent of Debian and Sistina.
Please don't post bug reports about these packages in the Debian BTS or
Sistina's bugzilla.

patrick
