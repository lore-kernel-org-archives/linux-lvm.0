From: Herbert Poetzl <herbert@13thfloor.at>
Subject: Re: [linux-lvm] dump/restore on a regular file?
Message-ID: <20040117072924.GA29154@MAIL.13thfloor.at>
References: <BAY9-F23qkf5tjDpd3n000023e1@hotmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BAY9-F23qkf5tjDpd3n000023e1@hotmail.com>
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
Date: Sat Jan 17 02:30:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kanika nema <kanikanema@hotmail.com>
Cc: linux-lvm@sistina.com

On Sat, Jan 17, 2004 at 12:20:37PM +0530, kanika nema wrote:
> hi,
> 
> I wanted to use the dump/restore using the backup as a regular file, 
> instead of the tape. I read the manpages and the documentation on 
> dump/restore..but i cant figure out how to do it on a regular file.
> 
> The manpage says the file can be anything:
> 
>                      Write the backup to file; file may be a special device 
> file like
> 	     /dev/rmt12 (a tape drive), /dev/rdisk1s3 (a disk drive), an 
> 	     ordi-
> 	     nary file, or `-' (the standard output).
> 
> I tried using a regular file, but it keeps tryin to open the tape device, 
> and it cant do it and the dump aborts.
> 
> Can someone tell me how to do this correctly, or is it that dump/restore 
> works only on tape drives (coz thats what it was originally built for).

dump 0f /backup/file.dump /mnt/path
  (normal dump of fs in /etc/fstab)

or 

dump 0zf /backup/file.dump /other/mnt/path
  (does compressed dumps, smaller)

or 

dump 0zf /backup/file.dump /dev/unknown
  (dump of device not in /etc/fstab)

HTH,
Herbert

> thanx for ur help,
> Kanika
> 
> _________________________________________________________________
> Free drafts to 700 locations. 
> http://server1.msn.co.in/msnleads/suvidha/dec03.asp?type=hottag Click here.
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
