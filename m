References: <8788b5db-6667-6060-e66a-beab7d3a56fc@nebelschwaden.de>
	<080c04ff-e9cc-8a9e-da66-2c125a657d86@nebelschwaden.de>
	<28fac0e3-5853-76e2-5f9f-c4ae7b35c4a8@nebelschwaden.de>
	<bdbb0195-8b35-f732-1db8-641c3fbdc20f@redhat.com>
	<259b3ff3-9413-6e8d-56b3-1c17a1d22c0c@nebelschwaden.de>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <0a242f0f-ba4f-79fd-caf0-d06c7eb13407@redhat.com>
Date: Mon, 13 Jan 2020 20:11:17 +0100
MIME-Version: 1.0
In-Reply-To: <259b3ff3-9413-6e8d-56b3-1c17a1d22c0c@nebelschwaden.de>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: listac@nebelschwaden.de, LVM general discussion and development <linux-lvm@redhat.com>

Dne 13. 01. 20 v 17:35 Ede Wolf napsal(a):
> Hello Marian,
> 
> thanks for that advice, but my� thin-provisioning-tools already� are at 
> version 0.8.5
> 
> Basically I consider the data now lost.
> 

Hi

Why do you think they are lost ?

Don't you have any 'valid' LV with metadata ?

You can use your 'too big' metadava LV and 'thin_repair' it to appropritely 
sized one -  it should work easily.

Regards

Zdenek
