Message-ID: <9BBB7C9EFEF1874BAC4DC204E867EFAF02560C7B@s99mail06>
From: "Little, Chris" <Chris.Little@okdhs.org>
MIME-Version: 1.0
Subject: [linux-lvm] Data corruption after an lvm snapshot
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
Date: Fri Nov 21 14:55:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

We are using SLES 8 sp2 to host an 9.2.0.3 database on Linux/390 (31-bit).
We are using the -s option of lvcreate (snapshot) for use as a backup. After
the snapshot the _source_ data is corrupted. An fsck reports that the
filesystems are ok, but a dbverify reports corrupt header blocks. Does
anyone have any experience using snapshot to create backup images for their
databases? Has this been encountered before? 

+---------------------------------------------------------------------------
+
 | Chris Little                chris.little@okdhs.org                      |
 | Ok Dept of Human Services   Data Services Division  (405)522-1306       |
+---------------------------------------------------------------------------
+
