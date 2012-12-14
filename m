Message-ID: <50CB8477.30708@ubuntu.com>
Date: Fri, 14 Dec 2012 14:56:39 -0500
From: Phillip Susi <psusi@ubuntu.com>
MIME-Version: 1.0
References: <50C9F2D6.7090802@ubuntu.com> <20121214192953.GB3148@redhat.com>
In-Reply-To: <20121214192953.GB3148@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Non 512 byte sectors
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
To: Mike Snitzer <snitzer@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 12/14/2012 2:29 PM, Mike Snitzer wrote:
> On Thu, Dec 13 2012 at 10:23am -0500, Phillip Susi
> <psusi@ubuntu.com> wrote:
> 
>> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
>> 
>> Is it possible to get dm to report > 512 byte sector size?  If
>> so, how?
> 
> DM will automatically stack the physical and logical sector sizes
> based on the devices that are assembled into the DM device.

Yes, but what if I am using two physical disks with 512 byte sectors,
but want the dm to appear to have 2048 byte sectors?



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (MingW32)
Comment: Using GnuPG with undefined - http://www.enigmail.net/

iQEcBAEBAgAGBQJQy4R3AAoJEJrBOlT6nu75GM0H/i0g4eBfeN46t7vbtpT+r4OD
mFCBtQbxOnfkfQ8IkPZ38Hsy1iH/Hz+Rp9EwImr0hLLj2VzsbUIuyvVNQ4gJAiev
klU0runpVGCXb78QJMij98w4fgcadakpsdS6YYfHjk9jsTJnIsAH/cLNNvhIA00h
GPUSGklLmjyoGdb7EaN2XpzSgoDvBTgjnuLN29cAI64N0CawuHttwZF+aicS59I4
uDxfSGe/7Za0K7+dWsVqqqjcup8eGouhVX94bGG2NdZTt+hQFDj9UQm5zQrjiqpn
MMIqBbi1s3SqlHPzDomhD1pAMDkT6wwXin+ERt5FXudHnf9FqiEe4g0xLJ8CkTs=
=UlfN
-----END PGP SIGNATURE-----
