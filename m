Return-Path: <mauelshagen@sistina.com>
Date: Tue, 26 Jun 2001 16:19:47 -0500
From: Heinz Mauelshagen <mauelshagen@sistina.com>
Message-ID: <20010626161947.A11918@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Request for misalignment tests
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

All,

we need your help in regard to the misalignment problems we are trying
to fix right now in order to get facts concerning how many people are actually 
suffering from it.


In case you created VGs or extended them with LVM 0.9.1 Beta 6 or 7,
we'd appreciate if you could send us the output (if any) of

   pvdisplay -v /dev/YourPVname | grep "^ *00000"

if the sector offset in the last column is odd.

If so, please add a "pvdisplay /dev/YourPVname" as well.

We appreciate your help!

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
