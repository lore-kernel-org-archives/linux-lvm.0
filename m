From: Bart Van Assche <bart.vanassche@sandisk.com>
Message-ID: <bc117214-789f-85b3-35f4-db067fcbfe14@sandisk.com>
Date: Fri, 18 Nov 2016 13:59:20 -0800
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] [PATCH 0/2] Move AC_PYTHON_MODULE() macro definition
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Bryn M. Reeves" <bmr@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>
Cc: Alasdair G Kergon <agk@redhat.com>, linux-lvm@redhat.com

Hello Bryn, Zdenek and Alasdair,

While building lvm2 I noticed that AC_PYTHON_MODULE() has been defined 
in aclocal.m4. I think that is wrong because that file can get 
overwritten by the autotools, e.g. when running autoreconf -ivf. Hence 
this patch series. Please take these patches in consideration for 
integration in the upstream lvm2 repository.

Thanks,

Bart.
