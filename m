From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] restoration of LVM setup?
Message-ID: <20030312132252.A1259@sistina.com>
References: <200303111936.24376.novafire@novafett.com>
Mime-Version: 1.0
In-Reply-To: <200303111936.24376.novafire@novafett.com>; from novafire@novafett.com on Tue, Mar 11, 2003 at 07:36:24PM -0600
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
Date: Wed Mar 12 06:24:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Mar 11, 2003 at 07:36:24PM -0600, Nova FIre wrote:
> 	I am thinking about setting up LVM on my file server and would like to know 
> how easy it is to re-setup a LVM layout if I install a new distro.   A few 
> times I have had one of the OS drives fail on me which required a fresh 
> install of linux on a new drive.  But since all my file storage drives were 
> just single ext3 partitions I could mount them and the file server was back 
> up in no time with no loss of important data.  
> 
> 	How easy is it to do the same thing with a LVM setup?  

Presumably the new distro has LVM in, it is a question of
scanning in the LVM metadata (vgscan) and activating the VG(s) (vgchange -ay).

Depending on the distro's upgrade support that works for basic filesystems
on LVs (/usr, /opt, ...) as well.

> 
> 
> bjz
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
