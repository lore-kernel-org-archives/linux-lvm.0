From: Eric Ren <zren@suse.com>
Message-ID: <bc1ccc58-1771-183b-2d40-1d8b198fb8b5@suse.com>
Date: Tue, 9 Jan 2018 11:15:24 +0800
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Subject: [linux-lvm] The benefits of lvmlockd over clvmd?
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: David Teigland <teigland@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

Hi David,

Regarding the question of the subject, I can think of three main 
benefits of lvmlockd over clvmd:

- lvmlockd supports two cluster locking plugins: dlm and sanlock. 
sanlock plugin can supports up to ~2000 nodes
  that benefits LVM usage in big virtulizaton/storage cluster, while dlm 
plugin fits HA clsuter.

- lvmlockd has better design than clvmd. clvmd is command-line level 
based locking system, which means the
  whole LVM software will get hang if any LVM command gets dead-locking 
issue. However, lvmlockd is *resources* based
cluster locking. The resources to protect is VG and LV so that the 
deadlock issue will be isolated inside the resource and
operations on other VG/LV can still proceed.

- lvmlockd can work with lvmetad.

But, I may be wrong in some points. Could you please help correct me and 
complete the benefit list?

Thanks!
Eric
