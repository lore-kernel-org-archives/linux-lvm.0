Message-ID: <3F167FA5.30201@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] dm-crypt - some info, and a few development questions
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
Date: Thu Jul 17 05:52:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: lvm-devel@sistina.com, linux-lvm@sistina.com

Hi, as i previously has talked about, me and a fellow student here at 
the computer science department at University of Copenhagen, 
http://www.diku.dk/ has started a graduate project to extend LVM2 and 
the Device-Mapper for the linux 2.5 (and possibly 2.6 kernel). The goal 
is to include better support for encryption in LVM2, since LVM ontop of 
loop-back encryption has it's disadvantages (everyhting is encrypted, 
and difficult to expand beyond one disk), and since loop-back encryption 
   on top of LVM has other disadvantages (cumbersome to resize, and 
difficult to use snapshots.)
We have commited our selves to a deadline of 1. october, and the plan 
was to use the rest of august to get a understanding of DM and LVM2,
extend the code in DM and LVM2 in august, test and report in september.

We plan to use the existing cryptoapi for ciphers and other encryption 
stuff.

The goal is to support all the nice features from LVM (snapshots, 
resize, move, more than one disk, ...) while allowing encryption on some 
of the LV's. This should be a lvcreate option.
Further more we want to support more than just one cipher (all in 
cryptoapi), more than one key length, and if possible a way to change 
the password (key). We were thinking of stealing the approach from PPDD 
that allows one to change the password, and add a working password. (i 
think they use the first 1024 bytes? of the loop-backdevice to store the 
encryption key in an encrypted manner, and then the password decrypts 
the key into memory which then encrypts the device. By changing the 
password i suppose one just encrypts the key with another password).

Since we would like this included in the default LVM tree, and thus in 
linus default tree, we do intend to make a minimal impact on the rest of 
the LVM2 code, DM-code and other linux code. How ever, this leaves a few 
questions:
-------------------------------------------------------------------------
are others working on dm-crypt ?

should we subscribe to another mailinglist, possibly the kernel mailing 
list, or does the mail about lvm2 and DM development happen at 
lvm-devel@sistina.com ?

Can we safely asume that we can use the first 1024 bytes of the LV to 
store data in? (i would asume no, since LVM1 does NOT work ontop of 
PPDD). Can we store it somewhere else? like somewhere in the LVM system, 
there must be some information about each LV and a datastructure for 
each of them. If we then expand that, then they will quite possibly grow 
quite alot bigger than it is now, however, it might be possible to use a 
link to the key, and thus not expand each structure with 1024? bytes, 
but then we need to store it somewhere else. (we dont know yet if 1024 
bytes are needed, but it is my understanding that PPDD uses 1024 bytes, 
and thus, we would proberly use something similar to that).

Can we use the same major and minor number as a standard unencrypted LV? 
Or must we get a new one? I suppose that the LVM2 system already has to
hook into a write to the blockdevice and redirect it to the correct 
place. Can we extend such a hook with a test if the LV is encrypted or 
not, and if it is, use our write and not the default? Or does this new
system have a different major/minor and write() for each different 
DM-driver?





JonB
ps: there might possibly be other stuff we would need to know, feel free 
to give suggestions
