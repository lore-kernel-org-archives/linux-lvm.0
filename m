Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Fri, 25 May 2001 08:43:45 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Problem deleteing PV's
Message-ID: <20010525084345.D826@tykepenguin.com>
References: <OFD6F650E6.4F2A1D36-ON85256A56.004C77FE@raleigh.ibm.com> <004901c0e478$a3c85ec0$5300000a@cavecreek.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <004901c0e478$a3c85ec0$5300000a@cavecreek.net>; from jbooth@ccbill.com on Thu, May 24, 2001 at 10:40:35AM -0700
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, May 24, 2001 at 10:40:35AM -0700, Justin Booth wrote:
> Tried doing the "dd if of bs count" stuff and now I'm recieving a
> pvscan -- ERROR "pv_reaad(): PV identifier invalid" reading physical volumes
> 
> any ideas ???
> 

Stop worrying about it?

Those disk are no longer PVs so what's the problem? In fact when a PV is no
longer in a VG (ie shows up in pvscan but not allocated to a VG) then you are
free to reuse the disk/partition for something else.

It's OK, your PVs are deleted. Honest :-)

patrick
