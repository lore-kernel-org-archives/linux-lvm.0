Date: Tue, 5 Apr 2005 22:50:21 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20050405215021.GK9049@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM2 / device-mapper packages
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: device-mapper development <dm-devel@redhat.com>, linux-lvm@redhat.com

I've updated the stable pointers to point to the latest packages:

  LVM2: 2.01.09
  device-mapper: 1.01.01 

and I recommend updating to those packages.

Dependencies:
  Upgrade device-mapper to 1.01.something before upgrading
  lvm2 to 2.01.something - keep the middle component numbers (.01.)
  in step with each other.
 

I've only been applying bug fixes for some time now:
The next release will start incorporating new features again,
so expect a period of less-stable development-only releases.

Alasdair
-- 
agk@redhat.com
