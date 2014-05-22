Date: Thu, 22 May 2014 16:22:32 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
Message-ID: <20140522152232.GC14236@redhat.com>
References: <20140522101837.GB14236@redhat.com> <537E0D25.7010108@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <537E0D25.7010108@redhat.com>
Subject: Re: [linux-lvm] Testing the new LVM cache feature
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Zdenek Kabelac <zkabelac@redhat.com>

Well I'm happy to experiment for you.

At the moment I'm stuck here:

# vgcreate vg_cache /dev/sdc1
  Volume group "vg_cache" successfully created
# lvcreate -L 1G -n lv_cache_meta vg_cache
  Logical volume "lv_cache_meta" created
# lvcreate -L 229G -n lv_cache vg_cache
  Logical volume "lv_cache" created
# lvs
  LV                     VG        Attr       LSize   [...]
  lv_cache               vg_cache  Cwi---C--- 229.00g
  lv_cache_meta          vg_cache  -wi-a-----   1.00g
  testoriginlv           vg_guests -wi-a----- 100.00g

# lvconvert --type cache-pool --poolmetadata /dev/vg_cache/lv_cache_meta /dev/vg_cache/lv_cache
  Logical volume "lvol0" created
  Converted vg_cache/lv_cache to cache pool.

# lvs
  LV                     VG        Attr       LSize   [...]
  lv_cache               vg_cache  Cwi---C--- 229.00g
  testoriginlv           vg_guests -wi-a----- 100.00g

# lvconvert --type cache --cachepool vg_cache/lv_cache vg_guests/testoriginlv
  Unable to find cache pool LV, vg_cache/lv_cache
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

It seems as if vg_cache/lv_cache is a "cache pool" but for some reason
lvconvert is unable to use it.

The error seems to come from this code:

    if (!(cachepool = find_lv(origin->vg, lp->cachepool))) {
            log_error("Unable to find cache pool LV, %s", lp->cachepool);
            return 0;
    }

Is it looking in the wrong VG?

Or do I have to have a single VG for this to work?  (That's not made
clear in the documentation, and it seems like a strange restriction).

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
libguestfs lets you edit virtual machines.  Supports shell scripting,
bindings from many languages.  http://libguestfs.org
