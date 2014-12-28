Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sBTHF9D9013814
	for <linux-lvm@redhat.com>; Mon, 29 Dec 2014 12:15:09 -0500
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sBTHF6aA028732
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 29 Dec 2014 12:15:08 -0500
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1Y5duL-00089l-14
	for linux-lvm@redhat.com; Mon, 29 Dec 2014 18:15:05 +0100
Received: from 83.208.252.159 ([83.208.252.159])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Mon, 29 Dec 2014 18:15:05 +0100
Received: from mcepl by 83.208.252.159 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Mon, 29 Dec 2014 18:15:05 +0100
From: =?UTF-8?Q?Mat=C4=9Bj?= Cepl <mcepl@cepl.eu>
Date: Sun, 28 Dec 2014 08:53:59 +0100
Message-ID: <slrnm9vdon.u5a.mcepl@mitmanek.ceplovi.cz>
References: <20141222231928.GA29344@sh-el6.eng.rdu2.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Messed up metadata for thin pool?
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
To: linux-lvm@redhat.com

On 2014-12-22, 23:19 GMT, Matej Cepl wrote:
> Could anybody point me in the direction of recovering my data, 
> please?

With a lot of in-between-Christmas-help from Zdeněk Kabeláč 
(thank you!) I have ended up with the working system and these 
two bugs:

 * https://bugzilla.redhat.com/show_bug.cgi?id=1177056
 * https://bugzilla.redhat.com/show_bug.cgi?id=1177060

Best,

Matěj
