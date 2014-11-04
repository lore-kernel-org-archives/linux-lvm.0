Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sA4DITCv016690
	for <linux-lvm@redhat.com>; Tue, 4 Nov 2014 08:18:29 -0500
Received: from mx0c-00131701.pphosted.com (mx0d-00131701.pphosted.com
	[67.231.151.1])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sA4DIQla009893
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <linux-lvm@redhat.com>; Tue, 4 Nov 2014 08:18:27 -0500
From: "Aubin, Jean-Francois" <jean-francois.aubin@cgi.com>
Date: Tue, 4 Nov 2014 13:18:22 +0000
Message-ID: <A61B185A3ECC9B42B8B4B761DDA0523BE4E58BB2@CORPOWM-24.cgiclients.com>
References: <CAHDsjKtjVuOVsEtzPpt-7x8BV1ficT7RQb5TVyUenutnuAnqMw@mail.gmail.com>
	<545893A6.2020503@redhat.com>
In-Reply-To: <545893A6.2020503@redhat.com>
Content-Language: fr-FR
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Volume "avg/alv" is not active locally.
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
Content-Type: text/plain; charset="utf-8"
To: "daniel.savard@gmail.com" <daniel.savard@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Hi Daniel,

Post your lvm.conf. All disk sdX is on SAN or  Local disk? If in SAN, do you use multiphating? If yes, watch your blacklist in multipath.conf or other typo error.

Bonne journ�e!

J-F Aubin 

-----Message d'origine-----
De�: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] De la part de Peter Rajnoha
Envoy�: 4 novembre 2014 03:52
��: daniel.savard@gmail.com
Cc�: LVM general discussion and development
Objet�: Re: [linux-lvm] Volume "avg/alv" is not active locally.

On 11/04/2014 02:15 AM, Daniel Savard wrote:
> Hi,
> 
> I am running LVM2 on linux (Gentoo) with systemd and dracut. I ran 
> into a problem I am unable to find the cause.
> 
> I am trying to create a LV and I received an error as per the subject 
> of this post.
> 
> For example:
> 
> feynman ~ # lvcreate -a y --contiguous y --size 1G --name db2data
> donneesvg   Volume "donneesvg/db2data" is not active locally.
>   Aborting. Failed to wipe start of new LV.
> 
> What is going on? Any hints? What does it mean "not active locally"?

LVM tries to wipe the LV - zero out first 4KiB of data and also any old signatures it may find on any newly created LV for it to be properly initialized.

But this LV has not been activated. One reason may be that you have activation/volume_list set in LVM configuration (/etc/lvm/lvm.conf) and it does not include the name of the LV you're just creating.

The "lvcreate -vvvv ...." should provide more info on why the activation has been skipped.

--
Peter

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
