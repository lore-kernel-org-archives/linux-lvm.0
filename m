Message-Id: <4.2.2.19991207072539.00a88c50@pop-server.austin.rr.com>
Date: Tue, 07 Dec 1999 07:27:32 -0600
From: Daniel Whicker <heimdall@mail.org>
Subject: [linux-lvm] Kernel Traffic...
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

For those that may have missed it, Kernel Traffic #45 had a short blurb on LVM:
http://kt.linuxcare.com/


1999/11/19 - 21 (17 posts): Re: Announce: LVM Patch against kernel 2.3.28
David Weinehall asked when LVM (Logical Volume Manager) would be folded 
into the Linus tree. He opined, "this is imho one of the most important 
things to go into the kernel, from an enterprise point of view." Ulrik De 
Bie replied that patches had been sent to Linus, but had not been 
acknowledged. Ulrik guessed Linus was pretty busy lately. Heinz Mauelshagen 
also said Linus had received it several times but had not replied. He 
suggested that maybe some noise from David would make a difference. 
Christopher Horn asked if anyone knew any reason why LVM should not be 
folded into the kernel, and said wistfully, "It would be a blessing, 
especially if the journaling Ext2 or Reiserfs stuff was also folded into 
2.4 as well. The lack of a LVM and a JFS have unfortunately kept any 
serious Linux use out of our shop for a while now."
Hans Reiser replied, "I think that if you use the SuSE kernel you'll get a 
nicely patched well supported LVM for which we are developing a reiserfs 
resizer which SuSE will also support. (SuSE is a sponsor for ReiserFS.) I 
expect that LVM will eventually make it into the kernel, all of the FS 
developers that I know of for Linux have recommended that Linus add it. If 
you use a SuSE patched kernel you'll just get it somewhat earlier is all."
Alan also replied to Christopher, saying, "I can see LVM getting into a 
standard kernel but not really ext3 (journalling ext2) or reiserfs. Ext3 
adds stuff to the buffer cache behaviour that needs further figuring for 
2.3.x to make Linus happy. Reiserfs exports half of the buffer cache into 
itself and includes extra C files in fs/buffer.c and has similar questions 
to solve. There is also a problem that right now neither ext3 or reiserfs 
can journal over software raid."
Hans and Alan had a bit of respectful dispute over the problems of 
reiserfs, in which Alan said things like, "I'm not blaming anyone for it. 
Someone asked for a state of play," and Hans said things like, "It's your 
decision to make and I respect it."

									-Daniel
		------------------------------------------
		Daniel Whicker  (heimdall@mail.org)
