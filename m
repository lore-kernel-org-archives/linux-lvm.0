References: <CAGmFzSc8a8TZq7LtTuwwA+zrKmgQ722KubjHBeu4M2WW2KAZew@mail.gmail.com>
	<5AE1A4F4020000F9000B8935@prv1-mh.provo.novell.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <9682b67b-9a2b-e387-23f7-0ec1bbbb5309@redhat.com>
Date: Thu, 26 Apr 2018 10:33:02 +0200
MIME-Version: 1.0
In-Reply-To: <5AE1A4F4020000F9000B8935@prv1-mh.provo.novell.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Pvmove can work on cluster with LVM 2.02.120(2)
 (2015-05-15), or not?
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
To: Gang He <ghe@suse.com>, linux-lvm@redhat.com

Dne 26.4.2018 v 04:07 Gang He napsal(a):
> Hello Zdenek,
> 
> Do you remember LVM for this version supports PVmove, or not?
> Since there is a user which is pinging this question.
> 

Hi

lvm2 should be supporting clustered pvmove (in case cmirrord is fully 
functional on your system) - but I've no idea if you are hitting some old bug 
or you see some still existing one.

For reporting bug use some more recent version of tools - nobody is likely 
really going to hunt bugs in your 3 year old system here...


Regards

Zdenek
