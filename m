Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id qA6DIeKS006353
	for <linux-lvm@redhat.com>; Tue, 6 Nov 2012 08:18:40 -0500
Received: from chkenon.earlham.edu (chkenon.earlham.edu [159.28.1.87])
	by mx1.redhat.com (8.14.4/8.14.4) with SMTP id qA6DIcgb027990
	for <linux-lvm@redhat.com>; Tue, 6 Nov 2012 08:18:38 -0500
Received: from tdream.lly.earlham.edu (tdream.lly.earlham.edu [159.28.7.241])
	by chkenon.earlham.edu with ESMTP id m98MawC62x7vDg7I for
	<linux-lvm@redhat.com>; Tue, 06 Nov 2012 08:18:35 -0500 (EST)
Date: Tue, 6 Nov 2012 08:18:35 -0500 (EST)
From: Randy Schultz <schulra@earlham.edu>
In-Reply-To: <CANN7Ug1XvFE=_dmHDCh6psn87GF7iM56c6TW7_Xk8=muXdg+cQ@mail.gmail.com>
Message-ID: <alpine.BSF.2.00.1211060816390.3121@tdream.lly.earlham.edu>
References: <alpine.BSF.2.00.1211051646040.1851@tdream.lly.earlham.edu>
	<CANN7Ug1XvFE=_dmHDCh6psn87GF7iM56c6TW7_Xk8=muXdg+cQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="===============8312564242906161961=="
Content-ID: <alpine.BSF.2.00.1211060816590.3121@tdream.lly.earlham.edu>
Subject: Re: [linux-lvm] how to swap a bad drive on a non-standard mirror
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
To: LVM general discussion and development <linux-lvm@redhat.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--===============8312564242906161961==
Content-Type: TEXT/PLAIN; CHARSET=US-ASCII
Content-ID: <alpine.BSF.2.00.1211060816591.3121@tdream.lly.earlham.edu>

On Tue, 6 Nov 2012, Scott Merrilees spaketh thusly:

-}
-}Looks like a dmraid setup.  Googling Linux isw found me a rebuild guide.

Tnx much Scott and Stuart.  It seems being told they were set with LVM, I
fixated on it and didn't think to look deeper (even though the evidence was
smacking me in the face ;).

--
 Randy    (schulra@earlham.edu)      765.983.1283         <*>

nosce te ipsum
--===============8312564242906161961==
Content-Type: TEXT/PLAIN; CHARSET=us-ascii
Content-ID: <alpine.BSF.2.00.1211060816391.3121@tdream.lly.earlham.edu>
Content-Description: 
Content-Disposition: INLINE

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============8312564242906161961==--
