Received: from homer.msp.redhat.com (homer.msp.redhat.com [172.16.30.9])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i1DNPui24670
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 18:25:56 -0500
Received: (from agk@localhost)
	by homer.msp.redhat.com (8.11.6/8.11.6) id i1DNPtx26729
	for linux-lvm@redhat.com; Fri, 13 Feb 2004 17:25:55 -0600
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20040213172555.B14206@homer.msp.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM2 Internationalisation
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Fri Feb 13 18:25:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I've just checked in some changes to support internationalisation.

If anyone feels inclined to translate any of the messages,
the template file is po/lvm2.po, created with 'make pofile'. 
You can edit the makefile in that directory to exclude debug
messages etc. by removing one or more '--keyword' arguments
if you want to exclude the rarer messages.

Be aware that there is active development on this project, so some
messages will change.  A few don't support internationalisation
properly yet (e.g. plural 's' parameter). 

Alasdair
-- 
agk@redhat.com
