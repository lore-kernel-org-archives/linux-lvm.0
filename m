From: "James B. Byrne " <ByrneJB@Harte-Lyne.ca>
MIME-Version: 1.0
Message-ID: <3D242D75.3370.4A25E76@localhost>
In-reply-to: <E17Q3FS-0002v2-00@hermes.sistina.com>
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Subject: [linux-lvm] Re: linux-lvm digest, Vol 1 #624 - 8 msgs
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
Date: Thu Jul  4 10:12:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On 4 Jul 2002 at 4:49, "Heinz J . Mauelshagen" 
<mauelshagen@sistina.com> wrote:

> Did you just grow the LV?
> 

Yes

> You need to extend the FS using the respective FS resizing tool as
> well (resize2fs, resize_reiserfs, ...).
> 

Did that too.

> BTW: for ext2 the e2fsadm(8) command, which comes with LVM does both
> for you.
> 
> 

I tried this originally but I can't remember if it worked first off or if in 
my ignorance I ran it out of sequence, had problems, and ended up 
doing something else.  In any case eventually I managed to get the 
file system up to 350 Mb.

> This doesn't really explain the local/remote difference unless:
> 
> - local users had root credentials avoiding the fs
>   "reserved block count" to matter

As it turned out the local user did have root capability but when su to 
a non-privileged user the local file transfers also worked.
> 
> - files uploaded where very large compared to the locally stored files

The reverse in fact, the local files moved in for testing averaged 10x 
the size of normal ftp uploads.  However, the culprit was discovered 
and it wasn't lvm.  The problem appears to have been a simple 
permission problem in the directory tree for the ftp chroot.  Why 
pureftpd chose to report this as a disk full error is beyond me.

However, it is worth noting that rebooting the system, without 
making any other changes, caused pureftp to subsequently report a 
different error message for the same activity. The message didn't 
actually say access forbidden ( I think that it was more like "non 
existent file", but with the application of a little intuition it did point to 
a permissions problem.  

Regards,
Jim


---     e-mail is NOT a secure channel 
James B. Byrne                mailto:ByrneJB@Harte-Lyne.ca
Harte & Lyne Limited          http://www.harte-lyne.ca
9 Brockley Drive              vox: +1 905 561 1241
Hamilton, Ontario             fax: +1 905 561 0757
Canada  L8E 3C3
