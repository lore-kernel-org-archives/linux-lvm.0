From: Herbert Poetzl <herbert@13thfloor.at>
Subject: Re: [linux-lvm] dump/restore on a regular file?
Message-ID: <20040117182051.GC3264@MAIL.13thfloor.at>
References: <BAY9-F4CSDAmwtyL81300031cec@hotmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BAY9-F4CSDAmwtyL81300031cec@hotmail.com>
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
Date: Sat Jan 17 13:22:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kanika nema <kanikanema@hotmail.com>
Cc: linux-lvm@sistina.com

On Sat, Jan 17, 2004 at 03:52:21PM +0530, kanika nema wrote:
> hi,
> 
> thanx the dump did work. But now, my restore isnt working, it keeps telling 
> me
> "no tapes read yet"
> or
> ".foo was not found on the tape"
> 
> When i gave restore with option 'C', it tell me that some files were 
> modified.
> 
> Please help me with the restore too.
> Thank u so much,
> Kanika
> 
> 
> 
> >dump 0f /backup/file.dump /mnt/path
> >  (normal dump of fs in /etc/fstab)

I assume the fs is mounted (and clean) at /mnt/newfs

  (cd /mnt/newfs; restore rf /backup/file.dump)

will restore the entire dump ...

if you just want to copy files from A to B
you can use the sequence

 cd /mnt/B ; dump 0f - /mnt/A | restore rf -

if your dumps are pretty large, specifying a size
will help you -s  100000 (this is neither MB nor
kB or bytes, this is in feet ;)

make sure that restore has enough space on /var/tmp

HTH,
Herbert

> >or
> >
> >dump 0zf /backup/file.dump /other/mnt/path
> >  (does compressed dumps, smaller)
> >
> >or
> >
> >dump 0zf /backup/file.dump /dev/unknown
> >  (dump of device not in /etc/fstab)
> >
> >HTH,
> >Herbert
> >
> >> thanx for ur help,
> >> Kanika
> >>
> >> _________________________________________________________________
> >> Free drafts to 700 locations.
> >> http://server1.msn.co.in/msnleads/suvidha/dec03.asp?type=hottag Click 
> >here.
> >>
> >>
> >> _______________________________________________
> >> linux-lvm mailing list
> >> linux-lvm@sistina.com
> >> http://lists.sistina.com/mailman/listinfo/linux-lvm
> >> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >
> >_______________________________________________
> >linux-lvm mailing list
> >linux-lvm@sistina.com
> >http://lists.sistina.com/mailman/listinfo/linux-lvm
> >read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> _________________________________________________________________
> Gujarat Kite Fest at http://go.msnserver.com/IN/40247.asp 
> www.gujaratkitefest.com
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
