From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] "umount" LVM stuff
Message-ID: <20030225162138.C832@sistina.com>
References: <3E58E03E.3020401@machturtle.com> <20030223181304.V14285@zealot.blacknet.de> <3E5919A3.2010404@machturtle.com> <20030224021555.Y14285@zealot.blacknet.de> <20030224022433.Z14285@zealot.blacknet.de> <3E5A0961.80905@machturtle.com>
Mime-Version: 1.0
In-Reply-To: <3E5A0961.80905@machturtle.com>; from dcorbin@machturtle.com on Mon, Feb 24, 2003 at 07:00:33AM -0500
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
Date: Tue Feb 25 09:27:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Following this thread it kind of looks like you worked around
using LVM commands (i.e. removed a VG w/o using lvremove + vgremove).

If so, not a good idea :(

What does pvscan list ?
What does vgck say ?

On Mon, Feb 24, 2003 at 07:00:33AM -0500, David Corbin wrote:
> Goetz Bock wrote:
> 
> >On Mon, Feb 24 '03 at 02:15, Goetz Bock wrote:
> >  
> >
> >>>Attempts to access the logical volume I used to fail. 
> >>>      
> >>>
> >>You have disabled it, it's gone. 
> >>    
> >>
> >Don't panik :->
> >
> >your LVM will reappear, once you enable it again (vgchange -a y)
> >still, read some docs.
> >  
> >
> 
> I have read some docs.  I've spent hours combing the Net for the 
> answers, without success.
> 
> I *had* a working system.  But, I use the LVM commands so rarely, I can 
> never repeat what I did (notes or not).
> 
> piano:/home/dcorbin# sh -x /etc/init.d/lvm start
> + modprobe lvm
> + modprobe lvm-mod
> + '[' -e /proc/lvm ']'
> + '[' -e /etc/lvmtab ']'
> + '[' -x /sbin/vgscan ']'
> + echo 'Setting up LVM Volume Groups...'
> Setting up LVM Volume Groups...
> + /sbin/vgscan --verbose
> + /sbin/vgchange -a y --verbose
> 
> piano:/home/dcorbin# mount /data
> mount: special device /dev/vg0/data does not exist
> 
> The reason you hear "panic" in my typing is the last line. :)
> ----
> Fundamentally, I'm building a critical data file server.  LVM has caused 
> me enough problems and delays, that I'm about ready to bypass it, saying 
> it is putting my data at risk.  Feel free to convince me otherwise.
> 
> Thanks
> David
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
