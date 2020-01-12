References: <8788b5db-6667-6060-e66a-beab7d3a56fc@nebelschwaden.de>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <1c4af753-8f20-c50d-37a4-a3d8d8f979f9@redhat.com>
Date: Sun, 12 Jan 2020 19:11:40 +0100
MIME-Version: 1.0
In-Reply-To: <8788b5db-6667-6060-e66a-beab7d3a56fc@nebelschwaden.de>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] metadata device too small
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
To: listac@nebelschwaden.de, LVM general discussion and development <linux-lvm@redhat.com>

Dne 11. 01. 20 v 18:57 Ede Wolf napsal(a):
> After having swapped a 2,2T thinpool metadata device for a 16GB one, I've run

Hi

There was a good reason I've specified in my email to use the value 15G.

With 16G there is 'problem' (not yet resolved known issue) with different max 
size used by thin_repair (15.875G) & lvm2 (15.8125G) tools.

If you want to go with current max size supported by lvm2 - use the value 
-L16192M.


Regards

Zdenek
