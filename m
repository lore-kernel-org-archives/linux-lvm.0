From: "Jonathan Brett" <jbrett@wheremedia.com>
Message-ID: <NGBBJICHELACNEPKDJKGKEJBCAAA.jbrett@wheremedia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <E17AA5R-0008Kg-00@hermes.sistina.com>
Subject: [linux-lvm] LVM Reboot Problem
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
Date: Tue May 21 08:59:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I have my system configured with Redhat 7.3 with 2 80GB hard drives.  I made
a volume group using /dev/hdc and /dev/hda9.  Everything worked fine, I
copied data in there, put in the 'vgscan' and 'vgchange -a y' in the startup
script and put 'vgchange -a n' into the shutdown script.  However, when I
reboot my machine, the data is lost :(  I do a 'locate' on a file I know is
in there and it finds it.  However when I do a 'ls' in the directory,
nothing shows up.

What am I doing wrong here ???
