From: Christophe Saout <christophe@saout.de>
In-Reply-To: <20030924142145.GV12384@shell.blacknet.de>
References: <1064332301.5845.8.camel@david.internal.NorcrossGroup.com>
	 <1064343664.10276.3.camel@chtephan.cs.pocnet.net>
	 <3F717F13.1050407@silicide.dk>
	 <1064404776.5915.9.camel@chtephan.cs.pocnet.net>
	 <20030924142145.GV12384@shell.blacknet.de>
Message-Id: <1064506078.31091.15.camel@chtephan.cs.pocnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] RFC: DM encryption target?
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
Date: Thu Sep 25 11:09:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Am Mi, den 24.09.2003 schrieb Goetz Bock um 16:21:

> > Another way to do a password change would be to not reencrypt the device
> > but to store the symmetrical key somewhere else and encrypt it with a
> > password hash and to just reencrypt that key with another password.
> That would be nice, just use the first block for the key (giving you
> 512byte keysize, and you can generate a realy strong key[*]).
> 
> Just in idea.
> 
> [*] yes, i know it's only as strong as the user's password. 
>     Security is only as good as it's weekest link, and in the end
>     that's always the user.

I don't know, but couldn't the use of a one-sector block slow things
down because of alignment issues? Perhaps using a 4k block would be more
useful or storing the sector at the end of the device (like the linux
raid info sector).

I think that 512 bytes / 4096 bits should really be enough to store the
keys.

I could store the data in a simple text format, starting with a magic
header. Something like:

#CrYpT
version = 1
cipher = "aes"
mode = "cbc"
keysize = 256
pwdsalt = "0e3a5b4c"
pwdhash = "md5"
pwdenc = "3des"
key = "8e3eb...blabla..."
hash = "23e4f"
node = "/dev/mapper/crypt"
offset = ...useful?
size = ...useful?

A userspace program (dmcryptsetup) could be called like

dmcryptsetup /dev/hda5

It would then detect this sector at the end of that device, reads it,
asks the user for a password, combines it with the salt, hashes it (with
the given algorithm) and uses the result to decrypt the key. Then it
checks if the hash of the decrypted key matches the given one to be sure
that the key is the correct one.

Perhaps a public key encryption or something could also be useful (e.g.
if you have a private key on some usb stick to mount your partition?)

I'm really no crypto expert, but does this sound reasonable?

Additional lightweight / compatibility options could be to use a hashed
password directly as key, without this "key info sector" or to give the
key directly to the setup program.

Since the program would be userspace it would be linked to libcrypto
(from openssl) to get additional needed digests/ciphers for key
management. Does this sound ok?

--
Christophe Saout <christophe@saout.de>
Please avoid sending me Word or PowerPoint attachments.
See http://www.fsf.org/philosophy/no-word-attachments.html
