From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] hard disk crash
Message-ID: <20021031184941.A2339@sistina.com>
References: <3DC14DD0.37D877FE@silicide.dk> <Pine.LNX.4.44.0210311710370.25740-100000@server.piarista-kkt.sulinet.hu>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.44.0210311710370.25740-100000@server.piarista-kkt.sulinet.hu>; from nagyz@piarista-kkt.sulinet.hu on Thu, Oct 31, 2002 at 05:11:51PM +0100
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
Date: Thu Oct 31 11:54:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

You mentioned that you were dd'ing stuff of the partially failed drive.

If you get a replacement drive of the same size, dd everything onto it,
"pvcreate -ff ..." it and vgcfgrestore LVM's metadata onto it.
"vgscan;vgchange -ay" afterwards should bring your VG back to life but you
will loose some of your data.

As already said by Jon: you want to go RAID1/5.

On Thu, Oct 31, 2002 at 05:11:51PM +0100, NagyZ wrote:
> On Thu, 31 Oct 2002, Jon Bendtsen wrote:
> 
> > BAD idea. How cheap are harddrives these days ?
> 
> don have money ;)
> im looking for a solution for this case..
> any idea?
> 
> Nagyz
> 
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
