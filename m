Received: from breeves.fab.redhat.com (breeves.fab.redhat.com [10.33.0.40])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o9I9rkG1023437
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 18 Oct 2010 05:53:48 -0400
Message-ID: <4CBC192A.1090503@redhat.com>
Date: Mon, 18 Oct 2010 10:53:46 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <201010171233136560061@gmail.com>
In-Reply-To: <201010171233136560061@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Parse error question
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On 10/17/2010 05:33 AM, zhtiara wrote:
> Hi all
> When I run the LVM2 command（such as, pvs,lvs）, the following error message appears
> "Parse error at byte 16 (line 1): unexpected token"

You probably have a typo on line 16 of /etc/lvm/lvm.conf. What does it
say (paste the whole file into a pastebin service like
http://www.pastebin.com/ and send the link to the list).

E.g.:

/etc/lvm/lvm.conf
     13 devices {
     14
     15     # Where do you want your volume groups to appear ?
     16     gremlins
     17     dir = "/dev"

# pvs
  Parse error at byte 557 (line 17): unexpected token
  Failed to load config file /etc/lvm/lvm.conf

Regards,
Bryn.
