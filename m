Return-Path: <mauelshagen@sistina.com>
Date: Tue, 24 Jul 2001 23:57:38 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Message-ID: <20010724235738.A21917@sistina.com>
Mime-Version: 1.0
Subject: [linux-lvm] *** ANNOUNCEMENT *** LVM 0.9.1 Beta 8 available at www.sistina.com
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
To: linux-lvm@sistina.com, lvm-devel@sistina.com, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Cc: mge@sistina.com

Hi all,

a tarball of the Linux Logical Volume Manager 0.9.1 Beta 8 is available now at

   <http://www.sistina.com/>

for download (Follow the "LVM 0.9.1-Beta8" link).

This release fixes several bugs including a PE alignment bug which
was introduced with LVM 0.9.1 Beta 6.

In order to support all existing PEs, this release forces a minor
metadata format change. 

We strictly recommend that you read the metadata upgrade instructions
in README.1st contained in the tarball *before* you try to upgrade
your existing installations!
Support to downgrade the metadata format is included too.

See the CHANGELOG file contained in the tarball for further information.

Please help us to stabilize for LVM 1.0 ASAP and provide your test results,
bug fixes and advice.

Feed back related information to <linux-lvm@sistina.com>.

Thanks a lot for your support of LVM.

-- 

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
