Date: Sun, 3 Apr 2005 21:04:43 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Re: 2.6.11ac5 oops while reconstructing md array and
	moving volumegroup with pvmove
Message-ID: <20050403200443.GS14307@agk.surrey.redhat.com>
References: <20050401143853.GA11763@asalmela.iki.fi>
	<16973.56100.413874.917027@cse.unsw.edu.au>
	<20050402060937.GA27664@asalmela.iki.fi>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050402060937.GA27664@asalmela.iki.fi>
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Neil Brown <neilb@cse.unsw.edu.au>, Antti Salmela <asalmela@iki.fi>, linux-kernel@vger.kernel.org, dmo@osdl.org

On Sat, Apr 02, 2005 at 09:09:37AM +0300, Antti Salmela wrote:
> % mdadm --create -l 1 -n 2 /dev/md2 /dev/hde /dev/hdg
> % pvcreate /dev/md2
> % vgextend vg1 /dev/md2
> % pvmove /dev/hdf /dev/md2
 
A few similar reports still appearing, possibly still related to 
the md bio_clone changes that fixed some bugs for md but 
created new ones for dm...

Would be good if you could re-test with a current 2.6.12-
I'll look into later this week if nobody beats me to it - please!

Alasdair
