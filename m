From: Jose Luis Domingo Lopez <linux-lvm@24x7linux.com>
Subject: Re: [linux-lvm] creating a LVM ontop of a cryptated (ppdd) loop back device
Message-ID: <20021018213759.GA4471@localhost>
References: <3DAEDEE5.4540B954@silicide.dk> <20021017211217.GB4861@localhost> <3DAFB713.A2E7FAB3@silicide.dk>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3DAFB713.A2E7FAB3@silicide.dk>
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
Date: Fri Oct 18 16:38:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

On Friday, 18 October 2002, at 09:24:03 +0200,
Jon Bendtsen wrote:

> Jos� Luis Domingo L�pez wrote:
> > I haven't tried, but wouldn't it be possible to just take a snapshots
> > from a LV containing an encrypted filesystem, and then loop-mount it
> > (assuming encrypted via the loop device), give the password, and then
> > backup ?
> 
Well, I finally got to work, and made some test, as promised... And it
seems to work !. A list of commands used (and explanations) follows:

# First, create a test LV
# lvcreate --size 350M --name Test Group00
# Now, bind a loop device to the newly created LV (choose a password)...
# losetup -e blowfish /dev/loop0 /dev/Group00/Test
# ...and make a filesystem on the loop device (so it is encrypted in the LV)
# mke2fs /dev/loop0
# Detach the LV from the loop device...
# losetup -d /dev/loop0
# ...create a test mountpoint...
# mkdir /tmp/test
# ...and finally mount the encrypted FS (over a LV, passwprd needed)
# mount -t ext2 -o loop,encryption=blowfish /dev/Group00/Test /tmp/test

# Nothing fancy by now, just an encrypted filesystem, thanks to
# "loop-aes", but instead of using a partition, a simple test LV
# Now do whatever you want with this flashing new filesystem, for
# example, copy some files to it, so you have something to backup :-)

# Let's create a snapshot LV from the otriginal test LV
# lvcreate --size 50M --snapshot --name EncryptedSnapshot /dev/Group00/Test
# Make a directory to (hopefully) mount the encrypted volume
# mkdir /tmp/encryptedsnapshot
# And now, try to mount the snapshot volume. I don't know the details,
# but it seems by default the snapshot is read-only (don't know if you
# can change this with "lvchange"). So a "ro" argument to "mount" is 
# needed (you will need to supply the password chosen before).
# mount -t ext2 -o ro,loop,encryption=blowfish /dev/Group00/EncryptedSnapshot /tmp/encryptedsnapshot/
# Now you can backup from the snapshot volume, and then unmount...
# umount /tmp/encryptedsnapshot
# ...and be done with this snapshot...
# lvremove /dev/Grupo00/EncryptedSnapshot


As said in my first post to this thread, the encryption layer is
provided by loop-aes (loop-aes.sourceforge.net), which is easy to setup
and is quite well documented (except for one little but annoying detail:
instead of "AES", the algorithm is called "rijndael", otherwise "loop"
complains loudly about an "unknown algorithm type").

Hope this helps.

-- 
Jose Luis Domingo Lopez
Linux Registered User #189436     Debian Linux Woody (Linux 2.4.19-pre6aa1)
