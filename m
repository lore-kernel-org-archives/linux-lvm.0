From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] pvmove errors
Message-ID: <20030428105154.B27830@sistina.com>
References: <20030425165706.A17496@sistina.com> <GNEAKGKKMNLLGBACDNBJEEDGCGAA.carey@itfreedom.com>
Mime-Version: 1.0
In-Reply-To: <GNEAKGKKMNLLGBACDNBJEEDGCGAA.carey@itfreedom.com>; from carey@itfreedom.com on Fri, Apr 25, 2003 at 10:46:08AM -0500
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
Date: Mon Apr 28 03:58:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Apr 25, 2003 at 10:46:08AM -0500, Carey Jung wrote:
> > 
> > Well, _if_ the mapping was bogus that will likely cause overwrites.
> > No way to redo from start then :(
> >
> 
> Granted.  I think it may have killed (-9) pvmove when it was running.
> 
> How should I have proceeded when I saw the problem?
> 
> Can vgck find and fix these kinds of errors?

vgck is a read only checker. You need to run vgcfgrestore to restore
valid metadata to your PVs. Because you weren't able to change the VG
configuration after the pvmove problem, you should get your most recent 
configuration before the move back (and therefore your data :)

Please upgrade to 1.0.7 (and think about using LVM2.0 which we'll release soon)

> 
> Thanks much,
> Carey
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
