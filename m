From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Message-ID: <20031024122810.F848@sistina.com>
References: <courier.3F98BCD6.000001C4@softhome.net>
Mime-Version: 1.0
In-Reply-To: <courier.3F98BCD6.000001C4@softhome.net>; from adimaths@softhome.net on Thu, Oct 23, 2003 at 11:47:02PM -0600
Subject: [linux-lvm] Re: LVM release 1.0.5.51 : support for multipathing
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
Date: Fri Oct 24 05:27:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: adimaths@softhome.net
Cc: linux-lvm@sistina.com, Mauelshagen@sistina.com

On Thu, Oct 23, 2003 at 11:47:02PM -0600, adimaths@softhome.net wrote:
> Hi, 
> 
> In the TODO file of LVM release 1.0.5.51
> the point number 10 mentions about supporting
> Multipathing. 
> 
> Could you please let me know, for what kind of devices is multipathing
> going to be supported. Is this multiple paths due to multiple
> disk controllers connected to storage devices or something else. 

We plan to put no restrictions into LVM2/device-mapper ITR.

In case Linux 'sees' multiple paths to the same storage, we want
to be able to support those in LVM2.

This covers all thinkable configurations, no matter if it is multi-controllers
which are single-ported or single-controller which is multi-ported or
any mixtures of those.


> 
> regards
> Aditya Vasudevan 

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
