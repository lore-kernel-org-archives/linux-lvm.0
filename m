Return-Path: <iain@sandon.ca>
From: Iain Campbell <iain@sandon.ca>
Date: Thu, 19 Jul 2001 10:52:18 -0400
MIME-Version: 1.0
Message-Id: <01071910521800.01099@exodus>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Striped LV vs RAID0
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
To: linux-lvm@sistina.com

Would it be reasonable to state that a striped LV in a VG with a PE size of 
32 kB would be the functional equivalent of a RAID0 with a 32 kB chunk size?
  
Any comments on which would give the better performance?

iain
