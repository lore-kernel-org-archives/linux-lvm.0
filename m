From: Stephan Austermuehle <au@hcsd.de>
Message-ID: <20020607112710.A5563@babbage.hcsd.de>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] How well tested is the snapshot feature?
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
Date: Fri Jun  7 04:27:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

are there any known issues with the snapshot feature in LVM 1.0.4?
Using it for backups of XFS causes trouble and leads to kernel crashes
regularly. For the moment I can give hardly any details because XFS
filled the log file with zeros after crashing. Sometimes the kernel
oopses when running xfsdump, sometimes when I do lvremove on the
snapshot device.

Stephan
