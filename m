Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9EGIVDw017383
	for <linux-lvm@redhat.com>; Tue, 14 Oct 2008 12:18:31 -0400
Received: from gv-out-0910.google.com (gv-out-0910.google.com [216.239.58.185])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m9EGIKKb028543
	for <linux-lvm@redhat.com>; Tue, 14 Oct 2008 12:18:21 -0400
Received: by gv-out-0910.google.com with SMTP id n8so455913gve.13
	for <linux-lvm@redhat.com>; Tue, 14 Oct 2008 09:18:20 -0700 (PDT)
Message-ID: <a01fe36d0810140918q6033d6f6naf1f520b4e585505@mail.gmail.com>
Date: Tue, 14 Oct 2008 18:18:20 +0200
From: "Federico Simoncelli" <federico.simoncelli@gmail.com>
In-Reply-To: <a01fe36d0810140112q282e12e4xb4e86fb21e361086@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_102592_5958244.1224001100236"
References: <a01fe36d0810140112q282e12e4xb4e86fb21e361086@mail.gmail.com>
Subject: [linux-lvm] Re: Clustered snapshots
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
To: Linux LVM2 <linux-lvm@redhat.com>

------=_Part_102592_5958244.1224001100236
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Oct 14, 2008 at 10:12 AM, Federico Simoncelli
<federico.simoncelli@gmail.com> wrote:
> Looking at the LVM2 code (LVM2.2.02.40, tools/lvcreate.c:640):
>
> /* FIXME Allow exclusive activation. */
> if (vg_is_clustered(vg)) {
>        log_error("Clustered snapshots are not yet supported.");
>        return 0;
> }
>
> looks like there is no way to activate a snapshot in a clustered
> volume group. Is the documentation wrong?
> Is there anyone actively working on the "exclusive activation" FIXME
> that is mentioned in the comment?

Hi all,
  I worked a little on this issue and I came up with a working patch
for LVM2.2.02.32.
I'm not sure if my work is enough to prevent wrong behaviours but in
my tests worked ok.
The same patch should be applied both on the lvm2 and the lvm2-cluster
rpm packages in order to work.
To be able to set the lv as exclusive you have to deactivate it on the
other nodes with the command:

# lvchange -aln /dev/vg00/lvol1

and then you can create the snapshot:

# lvcreate --size 100M --snapshot --name snap /dev/vg00/lvol1
  Logical volume "snap" created

It automatically takes care to set the lv device as exclusive (vgchange -aey).
Can anyone review the patch?

Thanks in advance,
-- 
Federico.

------=_Part_102592_5958244.1224001100236
Content-Type: application/octet-stream;
 name=lvm2-2_02_34-fix-exclsnap.patch
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fmaq4tgu0
Content-Disposition: attachment; filename=lvm2-2_02_34-fix-exclsnap.patch

ZGlmZiAtdU5yIExWTTIuMi4wMi4zMi9saWIvYWN0aXZhdGUvZGV2X21hbmFnZXIuYyBMVk0yLjIu
MDIuMzItZXhjbHNuYXAvbGliL2FjdGl2YXRlL2Rldl9tYW5hZ2VyLmMKLS0tIExWTTIuMi4wMi4z
Mi9saWIvYWN0aXZhdGUvZGV2X21hbmFnZXIuYwkyMDA4LTAxLTA4IDE3OjQ3OjEwLjAwMDAwMDAw
MCArMDEwMAorKysgTFZNMi4yLjAyLjMyLWV4Y2xzbmFwL2xpYi9hY3RpdmF0ZS9kZXZfbWFuYWdl
ci5jCTIwMDgtMTAtMTQgMTE6NTc6NTQuMDAwMDAwMDAwICswMjAwCkBAIC04NTYsMTAgKzg1Niwx
MiBAQAogCiAJLyogSWYgdGhpcyBpcyBhIHNuYXBzaG90IG9yaWdpbiwgYWRkIHJlYWwgTFYgKi8K
IAlpZiAobHZfaXNfb3JpZ2luKHNlZy0+bHYpICYmICFsYXllcikgewotCQlpZiAoc2VnLT5sdi0+
dmctPnN0YXR1cyAmIENMVVNURVJFRCkgewotCQkJbG9nX2Vycm9yKCJDbHVzdGVyZWQgc25hcHNo
b3RzIGFyZSBub3QgeWV0IHN1cHBvcnRlZCIpOwotCQkJcmV0dXJuIDA7Ci0JCX0KKy8qIFRoaXMg
bWlnaHQgbm90IGJlIHRoZSByaWdodCBwbGFjZSBmb3IgdGhpcyBjaGVjaworICoJCWlmIChzZWct
Pmx2LT52Zy0+c3RhdHVzICYgQ0xVU1RFUkVEKSB7CisgKgkJCWxvZ19lcnJvcigiQ2x1c3RlcmVk
IHNuYXBzaG90cyBhcmUgbm90IHlldCBzdXBwb3J0ZWQiKTsKKyAqCQkJcmV0dXJuIDA7CisgKgkJ
fQorICovCiAJCWlmICghX2FkZF9uZXdfbHZfdG9fZHRyZWUoZG0sIGR0cmVlLCBzZWctPmx2LCAi
cmVhbCIpKQogCQkJcmV0dXJuXzA7CiAJfSBlbHNlIGlmIChsdl9pc19jb3coc2VnLT5sdikgJiYg
IWxheWVyKSB7CmRpZmYgLXVOciBMVk0yLjIuMDIuMzIvdG9vbHMvbHZjcmVhdGUuYyBMVk0yLjIu
MDIuMzItZXhjbHNuYXAvdG9vbHMvbHZjcmVhdGUuYwotLS0gTFZNMi4yLjAyLjMyL3Rvb2xzL2x2
Y3JlYXRlLmMJMjAwOC0xMC0xNCAxMjowMDowOC4wMDAwMDAwMDAgKzAyMDAKKysrIExWTTIuMi4w
Mi4zMi1leGNsc25hcC90b29scy9sdmNyZWF0ZS5jCTIwMDgtMTAtMTQgMTE6NTQ6MzcuMDAwMDAw
MDAwICswMjAwCkBAIC02NDcsMTYgKzY0NywxNSBAQAogCQkJCSAgImRldmljZS1tYXBwZXIga2Vy
bmVsIGRyaXZlciIpOwogCQkJcmV0dXJuIDA7CiAJCX0KLQkJLyogRklYTUUgQWxsb3cgZXhjbHVz
aXZlIGFjdGl2YXRpb24uICovCi0JCWlmICh2Z19zdGF0dXModmcpICYgQ0xVU1RFUkVEKSB7Ci0J
CQlsb2dfZXJyb3IoIkNsdXN0ZXJlZCBzbmFwc2hvdHMgYXJlIG5vdCB5ZXQgc3VwcG9ydGVkLiIp
OwotCQkJcmV0dXJuIDA7Ci0JCX0KIAkJaWYgKCEob3JnID0gZmluZF9sdih2ZywgbHAtPm9yaWdp
bikpKSB7CiAJCQlsb2dfZXJyKCJDb3VsZG4ndCBmaW5kIG9yaWdpbiB2b2x1bWUgJyVzJy4iLAog
CQkJCWxwLT5vcmlnaW4pOwogCQkJcmV0dXJuIDA7CiAJCX0KKwkJaWYgKCh2Z19zdGF0dXModmcp
ICYgQ0xVU1RFUkVEKSAmJiAhYWN0aXZhdGVfbHZfZXhjbChjbWQsIG9yZykpIHsKKwkJCWxvZ19l
cnJvcigiQ2x1c3RlcmVkIHNuYXBzaG90cyBhcmUgbm90IHlldCBzdXBwb3J0ZWQuIik7CisJCQly
ZXR1cm4gMDsKKwkJfQogCQlpZiAobHZfaXNfY293KG9yZykpIHsKIAkJCWxvZ19lcnJvcigiU25h
cHNob3RzIG9mIHNuYXBzaG90cyBhcmUgbm90IHN1cHBvcnRlZCAiCiAJCQkJICAieWV0LiIpOwo=

------=_Part_102592_5958244.1224001100236--
