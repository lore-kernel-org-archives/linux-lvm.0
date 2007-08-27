Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l7RDC9Zu002106
	for <linux-lvm@redhat.com>; Mon, 27 Aug 2007 09:12:09 -0400
Received: from an-out-0708.google.com (an-out-0708.google.com [209.85.132.244])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l7RDC82U025073
	for <linux-lvm@redhat.com>; Mon, 27 Aug 2007 09:12:08 -0400
Received: by an-out-0708.google.com with SMTP id c31so247942ana
	for <linux-lvm@redhat.com>; Mon, 27 Aug 2007 06:12:08 -0700 (PDT)
Message-ID: <f90461730708270612j42d3875fob523d223183e5790@mail.gmail.com>
Date: Mon, 27 Aug 2007 15:12:07 +0200
From: "Denis Richard" <drich68@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_90865_7588810.1188220327814"
Subject: [linux-lvm] Restore snapshot
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
To: linux-lvm@redhat.com

------=_Part_90865_7588810.1188220327814
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,
I use LVM snapshot to install a new software version.
So I create a snapshot of the partition where the soft is installed.
If the install finishes without any problem, I remove the snapshot.
But, if the install has a problem, I would like to restore the snapshot on
the initial partition,
to restore the old version of the soft.
Is there a command to do that "easily", different that copying the whole
snapshot partition on the initial one ?

Thanks for your answers.

Denis

------=_Part_90865_7588810.1188220327814
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div id="mb_0">Hi all,<br>I use LVM snapshot to install a new software version.<br>So I create a snapshot of the partition where the soft is installed.<br>If the install finishes without any problem, I remove the snapshot.
<br>But, if the install has a problem, I would like to restore the snapshot on the initial partition,
<br>to restore the old version of the soft.<br>Is there a command to do that &quot;easily&quot;, different that copying the whole snapshot partition on the initial one ?<br><br>Thanks for your answers.<br><span class="sg">
<br>Denis<br>
</span></div>

------=_Part_90865_7588810.1188220327814--
