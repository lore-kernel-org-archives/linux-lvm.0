Date: Sun, 7 Jan 2018 02:52:21 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20180107025221.GC4551@agk-dp.fab.redhat.com>
References: <e12eff82-677c-7e91-1697-eb955d1227b7@mglug.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e12eff82-677c-7e91-1697-eb955d1227b7@mglug.de>
Subject: Re: [linux-lvm] new max tag length?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oliver Rath <rath@mglug.de>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, Jan 07, 2018 at 02:04:06AM +0100, Oliver Rath wrote:
> Ive read here, the max length of a tag is 128:
> https://www.suse.com/documentation/sles11/stor_admin/data/lvmtagging.html

The original spec for this work remains in the source tree,
docs/tagging.spec:

+ 1) Tag character set: A-Za-z0-9_+.- 
+    Can't start with hyphen & max length is 128 (NAME_LEN).


Then if you look at WHATS_NEW:

Version 2.02.77 - 22nd November 2010
====================================
...
  Remove tag length restriction and allow / = ! : # & characters.

Alasdair
