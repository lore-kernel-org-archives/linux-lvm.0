Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE64C433EF
	for <linux-lvm@archiver.kernel.org>; Thu,  3 Feb 2022 10:21:31 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-cXaqdRCqMz63nqROYEVZbA-1; Thu, 03 Feb 2022 05:21:27 -0500
X-MC-Unique: cXaqdRCqMz63nqROYEVZbA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29BE918460E9;
	Thu,  3 Feb 2022 10:21:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC1E57B6F2;
	Thu,  3 Feb 2022 10:21:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 441454BB7C;
	Thu,  3 Feb 2022 10:20:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 213AKqFC008249 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 3 Feb 2022 05:20:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 171281121334; Thu,  3 Feb 2022 10:20:52 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11B771120AB2
	for <linux-lvm@redhat.com>; Thu,  3 Feb 2022 10:20:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA94D1044563
	for <linux-lvm@redhat.com>; Thu,  3 Feb 2022 10:20:48 +0000 (UTC)
Received: from sonic305-19.consmr.mail.ir2.yahoo.com
	(sonic305-19.consmr.mail.ir2.yahoo.com [77.238.177.81]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-149-3uymoZOPNhGUOvhsXILrlg-1; Thu, 03 Feb 2022 05:20:47 -0500
X-MC-Unique: 3uymoZOPNhGUOvhsXILrlg-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1643883646; bh=J2bACnRbAOLLYFuuJD9zZZ3jGFWRdfVyLh23IxawT6S=;
	h=X-Sonic-MF:Date:To:From:Subject:From:Subject;
	b=IVsvQjB6wHqg8vahGvRyKTtDfH2178oQ/OZX9f440ljY05pYJ6laoU1pbtJteiHVR3CwDtMNOSHImquDA+BJifE7otLi9+xV3L8fRFTFDE6uCmwwVA7NMQfWBO1J21EQW0PU5uTbUSYveqJrZiLzsMr6v2Vn3/RL5zU0dMMY5Z0Gg4jcvmehN+UOfw1mnZpQ8m3w+Pn+aFX5fu/4ZBRHMzpaC/QiaDshmOdzzehRNBM4wEO6HRO8x0pJXe8QsbcVA5FYxi5niPg/Nt6WSmFVOibwkSKZhnHwqOsqCa+62lG37mWGZWahTySsuYYu9mnv30ijswXziN+l+2qCcsv+wA==
X-YMail-OSG: 3z_NjZcVM1n.Hgpt0B1qcOZXLp9KVYM0cqI6UEoXPK_sg8eA7ssg6DYe4keTaym
	.cNCgEYWhUuuchpywA7_KcLtHlSf_MDuQwCe9S5cr_p0lHuvFR8OU5iPkFiSkMvntEOplyby5wMW
	cauXF0Vbs0tyFWnAqWa2kJYp7Gi_sACWTsgRCAcnbiL8n0XCRuVGeCkTP8TSSFjScpW9Q_UFlryJ
	W7PMNv8mYlCQbtvrVM_3LP5mARmlXXj8nONG0ZlDDUYLv.a3TFxygBWERSpx72oqmgoAIz4AN5h7
	piOK9u6swDIEad.FZWsPu4QnQ49myEuy6hvCzfLww4_K4KlAZ2kBWQ1UwXOMUMkoNh0FiAiAcJyG
	hms_H8jsJgPmpOSYh88qEbwXPqj48u6XXKO5oEVW.nnBckTgueCirfE1cL1CqPs8MF6KIzbm.uGv
	4oVaIZfz_WZ3le7yWtUHSgjFhxjit_1zgKKuirodrAf1nuU3hBwOXPwvbqhpvf9B6MSO8_rcha.q
	WeArAaJa_q5CF7BZuNiPf6.Va2ggLDl_HEnb1EoAGo6T.jUbIfHvEuMQdG6AcTBt5NtAsO0.BtQy
	9w3I6j3gbBEkVpznqCPuj1dE44Q0AkD54ME_.EcYk6UK0zqXBQcnREiR6kglSnCpFnmf1Mlrj8Ta
	0cIiCyreBcvnaDFw6pzpGtp0vVfjIOYF1RbuYT6tMOAPVN1aOI7Zad330ZCP6fgDW.OMs219_nXD
	1AEZYY91XCI.oDH0Dt3mktGcgnTrR1v5duTeMxAaR7IqtrhddkXYS9ENm.5unvhA0y_Zk8uhmFQb
	XSbx_51hm_qY6aa610J75u6i.rz1NqyRe38x4.Qdt3osti01NzZviAmwXMXXBxTfB8gFiacyFHpK
	8FA2eeDwYyv.lgJO45pOpacXwwsXwh_bnGMnpg0Vq_8WnnMwP6tA3cDAdNqrLct9xvzC6eCGboMK
	EzfEBOb6Gn7OhWKSrKHIFxRBpMTMPhvkabFxRKaoyqYLeAUI7.F3T7sCVrjzy7vgF.nUlsfx0rg.
	y3J.DRZgppgezFmYQzraCwwnvVTjcXuqitYOJfTZxEjXFT6vTz5F79jsnctpfQQDnh3ID0_Y_6qV
	nabUMg_CA92hHn67NNclSbxPFHOjAxbnvquUhUGh1m6VLTcRciCdDa76tkgpsSirSa_GXhQ9CX2I
	D2uZl1SeJGlSf.MtF.b7efG1UMSYlRlhR8Qt31AiLV_ezuuLOo1O2vuVYatg7UqdX.6pNVrYcifP
	kvoG.uiV7vJLq0HAIEzkxSnx83.LJNeCaAuywJGAnBeHOV5ZUB5DSw.PEftF7.bT8zUIjk1sEJDi
	ccwcbWHo0cyZgSF9enOkBjb_dtUlgWCtr8nmrqYt7pmv3pFpdw3hhTncwtL5PU7BxQfhmffEQu2Y
	QGH3lqWWvP68JrIpqLTx7DkbevNUofL9XVS.31hi1IxGNA5BmNLsPPCgkWgnC6PnEYsag2rWeVqD
	6xPt2NK5WPQpgGs6ffLu3MK9deb7yDLQXtWo55RrRnlY6_BK4t9Rkg2CQiHARMR3wCuvEbxl5F_4
	N9.gDjY8GEkp2x4DCRO_aqBSUgDeQZ_XbiV8AF7w2M8vPV1ayE5ZPOfvcqbvg6JLp0npWMMjs1pC
	j6_fq7C11pyfDVa2dQsHi45l4ziSI8hw6CktAh90O_0_nALR65qFUq2tzWNWDut0lcLvq2aEGW3r
	LBs0Iu3LvJG5rONtdnEhz5NRUe8KhZf7w5SaEMYM3R0PFMvc4ZhKV.6V2zVzdHdQ1yKaYpe_rNOn
	XcFsBhyFeqVjJV__84WNZmSzcAJ.g3BSjljdP8qpdt_F1soaLU1td1k05BktmBxzf40s0dldCV.4
	97.1e7v9BTcBXZ9omZcLwRz.1BbrLFm9t00Dvz.CHZipSWZqWBpmSlVG5L.2FdYOTdOrCKLfo0_h
	p0PLrGSzp19pLKj1p7I3.Yhq_wvsV_y8eDhq7pOQNCj.QU6gjFNCA8Ce1hJsoiIBYvbwRB7F0mO3
	DLhaDGlgX.tfnB.X9we.NMcaR2elqU5xQ8ZlR2knGxo8O1gC18BGuhKAfdrQrp86CP8HycddlwDN
	oFuTVVaCwxAHJx_gLkO9PcRj9zN.cmGgep.aBFlF1hxgJ_SY1D7Z.1Y4YxcPMbYUPboOJLfOXQlM
	j3U3.GgrUhx9DHEttTwrucWUWi5d8OZJFifZtDjBNHNIvBuZQuOAmTmRdyFuXKusb3euAC2NK_og
	2t2R5rxgyGyVVmk2_deNnNZjK4QJt2A79xMul_UZTCvVDVA--
X-Sonic-MF: <peljasz@yahoo.co.uk>
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic305.consmr.mail.ir2.yahoo.com with HTTP;
	Thu, 3 Feb 2022 10:20:46 +0000
Received: by kubenode505.mail-prod1.omega.ir2.yahoo.com (VZM Hermes SMTP
	Server) with ESMTPA ID c36488c7ef7622b6a46ee7db8a46300d; 
	Thu, 03 Feb 2022 10:20:42 +0000 (UTC)
Message-ID: <6d7e7954-8123-76e1-b02a-61621c02148d@yahoo.co.uk>
Date: Thu, 3 Feb 2022 10:20:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.5.0
To: LVM general discussion and development <linux-lvm@redhat.com>
From: lejeczek <peljasz@yahoo.co.uk>
References: <6d7e7954-8123-76e1-b02a-61621c02148d.ref@yahoo.co.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-lvm@redhat.com
Subject: [linux-lvm] lvmdevices - impossible to remove/cleanup device
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

SGkgZ3V5cy4KCldoYXQgaXMgdGhlIGlzc3VlIGhlcmU/CgotPiAkIGx2cwogwqAgRGV2aWNlcyBm
aWxlIHN5c193d2lkIGV1aS42NDc5YTczMDUwODMwMDAwIFBWSUQgbm9uZSBsYXN0IApzZWVuIG9u
IC9kZXYvbnZtZTFuMXA0IG5vdCBmb3VuZC4KIMKgIExWwqDCoCBWR8KgwqDCoMKgwqDCoCBBdHRy
wqDCoMKgwqDCoMKgIExTaXplwqDCoCBQb29sIE9yaWdpbiBEYXRhJcKgIE1ldGElIApNb3ZlIExv
ZyBDcHklU3luYyBDb252ZXJ0CiDCoCBkZXZzIGNzX3doYWxlIC13aS1hby0tLS0gODQ0LjIzZwog
wqAgcm9vdCBjc193aGFsZSAtd2ktYW8tLS0tIDQwLjAwZwogwqAgc3dhcCBjc193aGFsZSAtd2kt
YW8tLS0twqDCoCA3LjU0ZwoKLT4gJCBsdm1kZXZpY2VzIC0tZGVsZGV2IC9kZXYvbnZtZTFuMSA7
IGVjaG8gJD8KIMKgIERldmljZXMgZmlsZSBzeXNfd3dpZCBldWkuNjQ3OWE3MzA1MDgzMDAwMCBQ
VklEIG5vbmUgbGFzdCAKc2VlbiBvbiAvZGV2L252bWUxbjFwNCBub3QgZm91bmQuCiDCoCBEZXZp
Y2Ugbm90IGZvdW5kIGluIGRldmljZXMgZmlsZS4KNQoKLT4gJCBsdm1kZXZpY2VzIC0tZGVsZGV2
IC9kZXYvbnZtZTFuMSAtLWRldmljZXNmaWxlIApldWkuNjQ3OWE3MzA1MDgzMDAwMDsgZWNobyAk
PwogwqAgRGV2aWNlIG5vdCBmb3VuZCBpbiBkZXZpY2VzIGZpbGUuCjUKCm1hbnkgdGhhbmtzLCBM
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
bHZtIG1haWxpbmcgbGlzdApsaW51eC1sdm1AcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVk
aGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWx2bQpyZWFkIHRoZSBMVk0gSE9XLVRPIGF0
IGh0dHA6Ly90bGRwLm9yZy9IT1dUTy9MVk0tSE9XVE8v

