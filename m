content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID: <772FBCA525B8FB4C9299D8D27FD4A5AA04715E@ABCSYSEXC1.abcsystems.ch>
From: "Michael Vogt" <MichaelVogt@abcsystems.ch>
Subject: [linux-lvm] access special devices
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
Date: Wed Apr 30 03:45:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com.

hey everyone,

ive a question, i want to use lvm in my san environment, i use a san =
virtualisation. the point is, my (scsi) disks are not called /dev/sdX, =
they are called /dev/svm/svmXXX. when i run lvmdiskscan, those drives =
are not seen by lvm. also a pv create fails:

so i checked the source, and in the file /tools/lib/lvm_dir_cache.c are =
some definitions called LVM_DIR_PREFIX. i tried to add my definitions =
(/dev/svm/svm and svm/svm) but this didnt work. what i need to do, that =
my disks are aviable for lvm?

thanks in advance

michael
