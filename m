From: "kanika nema" <kanikanema@hotmail.com>
Mime-Version: 1.0
Message-ID: <BAY9-F23qkf5tjDpd3n000023e1@hotmail.com>
Subject: [linux-lvm] dump/restore on a regular file?
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
Date: Sat Jan 17 01:52:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

hi,

I wanted to use the dump/restore using the backup as a regular file, instead 
of the tape. I read the manpages and the documentation on dump/restore..but 
i cant figure out how to do it on a regular file.

The manpage says the file can be anything:

                      Write the backup to file; file may be a special device 
file like
	     /dev/rmt12 (a tape drive), /dev/rdisk1s3 (a disk drive), an ordi-
	     nary file, or `-' (the standard output).

I tried using a regular file, but it keeps tryin to open the tape device, 
and it cant do it and the dump aborts.

Can someone tell me how to do this correctly, or is it that dump/restore 
works only on tape drives (coz thats what it was originally built for).

thanx for ur help,
Kanika

_________________________________________________________________
Free drafts to 700 locations. 
http://server1.msn.co.in/msnleads/suvidha/dec03.asp?type=hottag Click here.
