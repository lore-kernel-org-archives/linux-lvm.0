From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Re: [lvm-devel] [ANNOUNCE] LVM reimplementation
    ready for beta testing
Message-Id: <20020131122624.C9764@sistina.com>
References: <20020130145408.I763@lynx.adilger.int>
    <Pine.LNX.4.10.10201302234340.19357-100000@pzat.meep.org>
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.10.10201302234340.19357-100000@pzat.meep.org>;
    from oolon@ankh.org on Wed, Jan 30, 2002 at 10:36:10PM +0000
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
Date: Thu Jan 31 05:31:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Jan 30, 2002 at 10:36:10PM +0000, James Hawtin wrote:
> Licencing is important to me, too. Also is it pv/lv compatible with lvm 1
> or is it system rebuild time.....

LVM2 supports the existing LVM1 on disk metadata format and will support another
so called format2 soon which has enhanced metadata redundancy and transaction 
oriented updates in order to largely reduce the likelyhood of inacessable
VGs and metadata restores.

IOW: it will make LVM more insensible to hardware flaws.


> 
> James
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

Regards,
Heinz    -- The LVM Guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
