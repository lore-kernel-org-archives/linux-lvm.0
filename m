Date: Tue, 21 Nov 2000 11:35:44 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] does lvm create a private region?
Message-ID: <20001121113544.I31689@srv.t-online.de>
Reply-To: Mauelshagen@sistina.com
References: <3A199868.F6D238B@geotec.net>
Mime-Version: 1.0
In-Reply-To: <3A199868.F6D238B@geotec.net>; from seric@geotec.net on Mon, Nov 20, 2000 at 03:32:24PM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Smith <seric@geotec.net>
Cc: linux-lvm@msede.com

On Mon, Nov 20, 2000 at 03:32:24PM -0600, Eric Smith wrote:
> Does LVM create a private region like veritas so disks can be found in
> case of controller/target/lun re-ordering?

Yes.
It checks for that and is able to deal with reordering.

-- 

Regards,
Heinz      -- The LVM guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Bartningstr. 12
                                                  64289 Darmstadt
                                                  Germany
Mauelshagen@Sistina.com                           +49 6151 7103 86
                                                       FAX 7103 96
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
