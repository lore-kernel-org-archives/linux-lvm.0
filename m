Message-Id: <4.1.19990212175131.00965a70@mail.msy.bellsouth.net>
Date: Fri, 12 Feb 1999 17:56:01 -0600
From: Daniel Whicker <heimdall@mail.org>
Subject: [linux-lvm] e2fsadm
In-Reply-To: <9902122341.AA29981@mailgate99.telekom.de>
References: <4.1.19990212173110.00976a30@mail.msy.bellsouth.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
Reply-To: linux-lvm@msede.com
List-Id: <linux-lvm.redhat.com>
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Actually, if you could send me a tarball of the entire tools directory, I
should be able to test it.  I'm not a C programmer, but It looks like you
changed the number of arguments for "lvm_check_number" in
"lib/lvm_check_number.c" from the code you have and the code in v0.5alpha
that I'm using. 

--Daniel

At 05:39 PM 2/12/99 , you wrote:
>> 
>> Heinz,
>> 	Playing around, I found what I *THINK* might be a slight bug with the
>> e2fsadm program.  I've compiled in the 0.5 LVM into a 2.0.36 kernel without
>> any problems.  I also have the resize2fs.rpm from PowerQuest installed.
>> The problem arises when I try to expand a filesystem.  For whatever reason,
>> e2fsadm doesn't recognize the ext2 filesystem that resides on the LV.  Am I
>> doing something incorrectly, or would you like some more information.
>> 
><SNIP>
>
>No, i'm sorry.
>This is a bug.
>
>Please test the following code instead e2fsadm.c and give me feedback.

									-Daniel
		------------------------------------------
		Daniel Whicker  (heimdall@mail.org)
