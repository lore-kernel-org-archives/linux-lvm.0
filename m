Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p4O9KSAQ027061
	for <linux-lvm@redhat.com>; Tue, 24 May 2011 05:20:28 -0400
Received: from smtp.smtpout.orange.fr (smtp11.smtpout.orange.fr
	[80.12.242.133])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p4O9KQ4W012214
	for <linux-lvm@redhat.com>; Tue, 24 May 2011 05:20:27 -0400
Received: from localhost (localhost [127.0.0.1])
	by axege.com (Postfix) with ESMTP id 79E9150089
	for <linux-lvm@redhat.com>; Tue, 24 May 2011 11:25:37 +0200 (CEST)
Received: from axege.com ([127.0.0.1])
	by localhost (axege.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XApz0cLN9Bqa for <linux-lvm@redhat.com>;
	Tue, 24 May 2011 11:25:36 +0200 (CEST)
Received: from [10.0.0.69] (unknown [10.0.0.69])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by axege.com (Postfix) with ESMTPSA id 619E950067
	for <linux-lvm@redhat.com>; Tue, 24 May 2011 11:25:36 +0200 (CEST)
From: "Franck Routier (personnel)" <alci@mecadu.org>
Date: Tue, 24 May 2011 11:20:23 +0200
Message-ID: <1306228823.2195.9.camel@franck-VPCCW2S1E>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Trim support on stripped volumes ?
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
To: linux-lvm@redhat.com

Hi,

I have set-up of server with 4 SSDs (OCZ Vertex 2) stripped using LVM.
Logical volume has been created using the -i 4 option (iostat confirms
that the 4 disks work in parallel when I write a file).

Ext4 fs is used on the volume, mounted with -discard option.

I am using kernel 2.6.38.

My question is : is there a chance that TRIM command makes its way to
the disks through LVM ? I've read contradictory informations on the web
and I'm sure this is the best place to ask.

My second question is : how would I make _sure_ it works ?
I've found a way to do it with hdparm --fibmap and hdparm --read-sector
here http://askubuntu.com/questions/18903/how-to-enable-trim

But I don't think this can work with LVM. Would there be a similar way
to make sure it is working while using LVM ?

Thanks a lot,

Franck
