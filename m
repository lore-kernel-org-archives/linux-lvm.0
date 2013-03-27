Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r2RIpNcx008431
	for <linux-lvm@redhat.com>; Wed, 27 Mar 2013 14:51:23 -0400
Received: from mail.bmsi.com (mail.bmsi.com [68.106.146.44])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2RIpMNK027721
	for <linux-lvm@redhat.com>; Wed, 27 Mar 2013 14:51:22 -0400
Received: from sdg.bmsi.com (sdg.bmsi.com [192.168.9.34] (may be forged))
	(authenticated bits=0)
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id r2RIpKL0014489
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 27 Mar 2013 14:51:21 -0400
Message-ID: <51533FA8.1060500@bmsi.com>
Date: Wed, 27 Mar 2013 14:51:20 -0400
From: Stuart D Gathman <stuart@bmsi.com>
MIME-Version: 1.0
References: <FAAB9C9B-FCA0-43CB-8B2C-F4F389941AAE@me.com>
	<533CFD97-2715-4B1C-A8C5-02161911747D@googlemail.com>
	<51509ECB.4050901@bmsi.com>
	<244E0086-C561-4034-BF26-31DFC419B72F@googlemail.com>
	<5150B555.4010207@bmsi.com>
	<0FEAF33E-7395-4820-9732-AFE70D3B5877@googlemail.com>
	<5150C1F8.8090107@bmsi.com>
	<CA+iDeo3WTK1gEiVzdmqA=kJ4nksZH-P76O1pBCL3MCTeme4zqg@mail.gmail.com>
	<5151A59B.5010909@bmsi.com>
	<B19531EF-251A-44D3-9835-3FDB33A2908B@googlemail.com>
In-Reply-To: <B19531EF-251A-44D3-9835-3FDB33A2908B@googlemail.com>
Content-Type: multipart/alternative;
	boundary="------------030201020005080905010903"
Subject: Re: [linux-lvm] vg disappeared after replacing disc in raid10
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
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------030201020005080905010903
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable

On 03/26/2013 02:13 PM, Bj=EF=BF=BDrn Nadrowski expounded in part:
>
> So, should I rewrite the beginning of the device with the dd command?
>
> What then?
>
> Thanks a lot for all your help!
>
You could try the dd, if it has a good chance of restoring the device to=20
before the pvcreate.  I don't know offhand how much of a PV pvcreate=20
overwrites.  Hopefully, an LVM guru can chime in. Before doing pvcreate,=20
things like vg_scan -v should give a clue as to whether knoppix is even=20
looking at md127.  You might need to tweak the device filter in lvm.conf=20
for knoppix.

--------------030201020005080905010903
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 03/26/2013 02:13 PM, Bj&ouml;rn Nadrowski
      expounded in part:<br>
    </div>
    <blockquote
      cite="mid:B19531EF-251A-44D3-9835-3FDB33A2908B@googlemail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=ISO-8859-1">
      <div>
        <div>
          <div>
            <div>
              <div><br>
              </div>
              <div>So, should I rewrite the beginning of the device with
                the dd command?</div>
              <div><br>
              </div>
              <div>What then?</div>
              <div><br>
              </div>
              <div>Thanks a lot for all your help!</div>
              <br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    You could try the dd, if it has a good chance of restoring the
    device to before the pvcreate.&nbsp; I don't know offhand how much of a
    PV pvcreate overwrites.&nbsp; Hopefully, an LVM guru can chime in.&nbsp;
    Before doing pvcreate, things like vg_scan -v should give a clue as
    to whether knoppix is even looking at md127.&nbsp; You might need to
    tweak the device filter in lvm.conf for knoppix.<br>
  </body>
</html>

--------------030201020005080905010903--
