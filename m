From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] rescanning a physical volume
Message-ID: <20030715230504.A26508@sistina.com>
References: <OF1D75A1D7.6633297C-ONCA256D64.000BB935-CA256D64.000C8213@centrelink.gov.au>
Mime-Version: 1.0
In-Reply-To: <OF1D75A1D7.6633297C-ONCA256D64.000BB935-CA256D64.000C8213@centrelink.gov.au>; from daniel.holt@centrelink.gov.au on Tue, Jul 15, 2003 at 12:16:30PM +1000
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
Date: Tue Jul 15 16:08:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Jul 15, 2003 at 12:16:30PM +1000, daniel.holt@centrelink.gov.au wrote:
> Hi,
> 
> we are messing around with LVM and dynamically increasing SAN disk 
> capacity.

There's none in LVM1.
LVM2 will have support for physical volume resizing soon.

Regards,
Heinz    -- The LVM Guy --

> 
> We are trying to get to a point where we can increase capacity to the host 
> dynamically on demand without interruption to the host. This is one of the 
> major advantages of a storage area network, we can increase the size of a 
> LUN on the fly, then we just need the host to pick it up. The reiser FS 
> can successfully increase itself over the new volume, we are just trying 
> to get LVM to pickup the new size of the physical volume.
> 
> Is there a command to re-scan the size of a physical device and update the 
> physical volume under LVM. We can't seem to find one.
> 
> any suggestions are very appreciated.
> 
> Daniel Holt
> SAN Tuning & Storage Administrator
> PH: (02) 6219 8047
> MOB: 0414 99 22 63
> 
> Important:  This e-mail is intended for the use of the addressee and may contain information that is confidential, commercially valuable or subject to legal or parliamentary privilege.  If you are not the intended recipient you are notified that any review, re-transmission, disclosure, use or dissemination of this communication is strictly prohibited by several Commonwealth Acts of Parliament.  If you have received this communication in error please notify the sender immediately and delete all copies of this transmission together with any attachments.
> 

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
