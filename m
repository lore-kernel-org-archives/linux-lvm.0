Date: Wed, 7 Jun 2000 19:07:57 +0200
From: Jan Niehusmann <jan@gondor.com>
Subject: [linux-lvm] Reliability
Message-ID: <20000607190757.A18846@gondor.com>
Mime-Version: 1.0
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

What happens when one of several drives in a vg fails? Is the whole vg
lost or only lv's that are on that pv? In the latter case, what about
lv's that are only partly located on that pv?

I once observed that with a corrupted partition table, causing one pv
to be lost, the whole vg didn't get detected. As I was able to reconstruct
the partition table, I didn't try very hard to get the vg running 
without that drive. 

Jan
