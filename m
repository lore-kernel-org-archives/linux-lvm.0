Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAJBeQr20089
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 06:40:26 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iAJBeNFo024257
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 06:40:24 -0500
Date: Fri, 19 Nov 2004 12:40:23 +0100
From: Luca Berra <bluca@comedia.it>
Message-ID: <20041119114022.GA21496@percy.comedia.it>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] [JPettey@overlandstorage.com: lvm LUN size]
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com
Cc: JPettey@overlandstorage.com

this should go to the list.
2.4 kernels have a 2TB block device limits
the lun size for lvm1 devices also depends on the number of pe per pv
that was specified at the vg creation time.

----- Forwarded message from JPettey@overlandstorage.com -----

Subject: lvm LUN size
To: bluca@comedia.it
From: JPettey@overlandstorage.com
Date: Thu, 18 Nov 2004 11:35:40 -0500
X-MIMETrack: Serialize by Router on SD-NOTES-S01/SanDiego/US 
    (Release 5.0.12  |February 13, 2003) at 11/18/2004 08:35:45 AM
X-Virus-Scanned: by amavisd-new at comedia.it
X-Spam-Status: No, hits=-0.4 tagged_above=-100.0 required=4.9 tests=BAYES_10,
 NO_REAL_NAME
X-Spam-Level: 
X-Spam-Score: -0.4

Luca -

Is the current LUN limitation for lvm 2TB? This would be in a 2.4 kernel
environment.

John Pettey
Systems Engineer
Eastern Region
301-261-4439
Overland Storage, Inc.
jpettey@overlandstorage.com
http://www.overlandstorage.com






----------------------------------------------------------------------------------------------
See our award-winning line of tape and disk-based
backup & recovery solutions at http://www.overlandstorage.com
----------------------------------------------------------------------------------------------


----- End forwarded message -----

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
