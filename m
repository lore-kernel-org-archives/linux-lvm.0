From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM and linux kernel 2.4.19
Message-ID: <20030226183327.A4117@sistina.com>
References: <689F43A6CF84E541A721C5C3FD5ADECC0F38DD@blr-m3-msg.wipro.com>
Mime-Version: 1.0
In-Reply-To: <689F43A6CF84E541A721C5C3FD5ADECC0F38DD@blr-m3-msg.wipro.com>; from sharad.tiwari@wipro.com on Wed, Feb 26, 2003 at 05:29:40PM +0530
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
Date: Wed Feb 26 11:39:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Feb 26, 2003 at 05:29:40PM +0530, Sharad Tiwari wrote:
> Hi all ...
>  
>             Can anyone elaborate on how much of support for LVM have
> been increased in the kernel 2.4.19 compared to 2.4.18 series ...
> Assuming that 1.0.6 is the latest version lvm do we need to apply any
> patch for lvm if we are using the kernel 2.4.19.;

Unless you want to use persistent snapshots, there's no need.

We will be releasing 1.0.7 soon which fixes a related bug found
by Dale J. Stephenson.


>  
> Warm regards,
> Sharad.
>  

> **************************Disclaimer**************************************************    
>  
>  Information contained in this E-MAIL being proprietary to Wipro Limited is 'privileged' 
> and 'confidential' and intended for use only by the individual or entity to which it is 
> addressed. You are notified that any use, copying or dissemination of the information 
> contained in the E-MAIL in any manner whatsoever is strictly prohibited.
> 
> ****************************************************************************************


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
