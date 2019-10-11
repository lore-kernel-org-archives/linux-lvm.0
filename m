From: Heming Zhao <heming.zhao@suse.com>
Date: Fri, 11 Oct 2019 11:50:41 +0000
Message-ID: <9beaffc6-d70e-c6cb-a964-5ce439499d75@suse.com>
References: <CH2PR18MB32067A650CBE520D9A0DC547CFB10@CH2PR18MB3206.namprd18.prod.outlook.com>
	<6b055125-2e06-df7d-89fa-6c347404a9cd@suse.com>
	<dd28a375-f1f5-9ae0-e843-cb67de3136a9@suse.com>
	<491a6f93-7b6d-0e51-5e0d-fc6911bd91e9@redhat.com>
In-Reply-To: <491a6f93-7b6d-0e51-5e0d-fc6911bd91e9@redhat.com>
Content-Language: en-US
Content-ID: <004A790AADDFCD43A25A5BFB9E55E625@namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] pvresize will cause a meta-data corruption with
 error message "Error writing device at 4096 length 512"
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
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and
	development <linux-lvm@redhat.com>, Gang He <GHe@suse.com>

For _raw_write_mda_header(), the latest codes are same as stable-2.02.
And below usage is wrong, should be fixed.
```
     if (!dev_write_bytes(mdac->area.dev, write1_start, (size_t)write1_size, write_buf)) {
         ... ...
         dev_unset_last_byte(mdac->area.dev); <==== invalid code, this time fd had been released.
         ... ...
     }
```

This issue only happened on our customer machine, when updating lvm2 from
2.02.120 (no bcache code) to 2.02.180 (contains bcache).

Thanks
zhm

On 10/11/19 6:38 PM, Zdenek Kabelac wrote:
> Dne 11. 10. 19 v 11:22 Heming Zhao napsal(a):
>> Only one thing I am confusion all the time.
>> When read/write error, lvm will call bcache_invalidate_fd & _scan_dev_close to close fd.
>> So the first successfully read (i.e.: f747), which following f748 finally has fc68's fd.
>> This will cause f747 metadata overwrite not f748.
>>
>>
> 
> Hi
> 
> Have you considered checking newer version of lvm2?
> 
> Regards
> 
> Zdenek
> 
> 
